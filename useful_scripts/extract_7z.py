"""
Usage examples:
    python useful_scripts/extract_7z.py /path/to/folder --output output --workers 4
"""
import argparse
import concurrent.futures
import os
import shutil
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import List

try:
    import py7zr
except Exception:
    py7zr = None
try:
    from tqdm import tqdm
except Exception:
    tqdm = None

@dataclass
class JobResult:
    archive: Path
    dest: Path
    success: bool
    message: str = ""


def find_archives(root: Path) -> List[Path]:
    archives: List[Path] = []
    for dirpath, _, filenames in os.walk(root):
        for fn in filenames:
            if fn.lower().endswith(".7z"):
                archives.append(Path(dirpath) / fn)
    return archives


def ensure_dir(p: Path) -> None:
    p.mkdir(parents=True, exist_ok=True)


def extract_with_py7zr(archive: Path, dest: Path, password: str | None) -> None:
    if py7zr is None:
        raise RuntimeError("py7zr is not installed")
    ensure_dir(dest)
    with py7zr.SevenZipFile(str(archive), mode="r", password=password) as z:
        z.extractall(path=str(dest))


def extract_archive(archive: Path, dest_root: Path, password: str | None, overwrite: bool = False)  -> JobResult:
    dest = dest_root / archive.with_suffix("").name
    if dest.exists() and any(dest.iterdir()) and not overwrite:
        return JobResult(archive=archive, dest=dest, success=False, message="destination exists (skip)")

    # If destination exists and overwrite is requested, remove it first
    if dest.exists() and overwrite:
        if dest.is_dir():
            shutil.rmtree(dest)
        else:
            dest.unlink()

    try:
        extract_with_py7zr(archive, dest, password)
    except Exception as e:
        return JobResult(archive=archive, dest=dest, success=False, message=str(e))

    return JobResult(archive=archive, dest=dest, success=True, message="extracted")


def parse_args(argv: list[str]) -> argparse.Namespace:
    p = argparse.ArgumentParser(description="Recursively extract .7z files using multiple threads")
    p.add_argument("path", nargs="?", default=".", help="Root path to search for .7z files")
    p.add_argument("--workers", "-w", type=int, default=0, help="Number of worker threads (0=auto/cpu_count)")
    p.add_argument("--output", "-o", default="", help="Output root directory (default: archive parent dir) - if set, extracted folders placed under this dir preserving structure")
    p.add_argument("--password", "-p", default=None, help="Password for encrypted archives (applies to all)")
    p.add_argument("--overwrite", action="store_true", help="Overwrite existing extracted folders")
    return p.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)

    root = Path(args.path).expanduser().resolve()
    if not root.exists():
        print(f"Path not found: {root}")
        return 2

    archives = find_archives(root)
    if not archives:
        print("No .7z archives found")
        return 0

    # Compute default output root mapping per archive
    output_root = Path(args.output).expanduser().resolve() if args.output else None

    workers = args.workers if args.workers and args.workers > 0 else os.cpu_count() or 4

    print(f"Found {len(archives)} archive(s). Workers: {workers}.")

    results: List[JobResult] = []
    # Use ThreadPoolExecutor because extraction is I/O and CPU mixed; threads avoid python-process overhead
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as ex:
        futures = []
        for a in archives:
            # Determine dest root: by default archive parent, else provided output root + relative path from root
            if output_root:
                try:
                    rel = a.parent.relative_to(root)
                except Exception:
                    rel = Path("")
                dest_root = output_root / rel
            else:
                dest_root = a.parent

            futures.append(ex.submit(extract_archive, a, dest_root, args.password, args.overwrite))

        # Iterate completed futures with an optional progress bar (tqdm)
        if tqdm:
            iterator = tqdm(concurrent.futures.as_completed(futures), total=len(futures), desc="Extracting")
        else:
            iterator = concurrent.futures.as_completed(futures)

        for fut in iterator:
            res: JobResult = fut.result()
            results.append(res)
            # Print only failures or skips to avoid flooding output
            if not res.success:
                status = "ERR"
                msg = f"[{status}] {res.archive} -> {res.dest} ({res.message})"
                if tqdm:
                    tqdm.write(msg)
                else:
                    print(msg)

    success_count = sum(1 for r in results if r.success)
    fail_count = len(results) - success_count
    print(f"Done. Success: {success_count}. Failed/skipped: {fail_count}")
    if fail_count:
        print("Failed/skipped archives:")
        for r in results:
            if not r.success:
                print(f" - {r.archive}: {r.message}")
    return 0 if fail_count == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())

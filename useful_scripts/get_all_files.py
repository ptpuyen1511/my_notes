from os import listdir
from os.path import isfile, join, isdir

def get_all_files_recursive(root):
    files = [join(root, f) for f in listdir(root) if isfile(join(root, f))]
    dirs = [d for d in listdir(root) if isdir(join(root, d))]

    for d in dirs:
        files_in_d = get_all_files_recursive(join(root, d))

        if files_in_d:
            for f in files_in_d:
                files.append(join(root, f))

    return files



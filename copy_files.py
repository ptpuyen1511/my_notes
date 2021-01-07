from shutil import copy2

def copy_file(source_files, target_folder):
    for file_name in source_files:
        try:
            copy2(file_name, target_folder)

        except:
            print('Error: ' + file_name)


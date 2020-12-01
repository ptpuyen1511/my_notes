import re
from pathlib import Path
from zipfile import ZipFile

def unzip(list_files):
    for file_name in list_files:
        if file_name.endswith('.zip') == False:
            print('Error: ' + file_name)
            continue

        try:
            # Search Student ID in file name
            # You can change to other format
            student_id_search = re.search(r'(\d+)\.', file_name)
            
            # Open zip file to extract
            zf = ZipFile(file_name, 'r')
            zf.extractall('target_foler/' + student_id_search.group(1))
            zf.close()

        except:
            print('Error: ' + file_name)


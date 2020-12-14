from pdf2image import convert_from_path

# Input file name
file_name = input('Enter file path: ')
pages = convert_from_path(file_name, 500)

# Input the page that you want to convert to image
page_to_convert = int(input('Enter the page that you want to convert: '))

# Input name of file out
file_out = input('Enter the name of output file (.jpg): ')

page_count = 0
for page in pages:
    page_count += 1

    if page_count == page_to_convert:
        page.save(file_out, 'JPEG')
        break

print(f'Converted page {page_to_convert} to image!')

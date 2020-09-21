import os
from PyPDF2 import PdfFileReader, PdfFileWriter

# Open file
path = input('Enter file path: ')
pdf = PdfFileReader(path, 'rb')
pdf_writer = PdfFileWriter()

# Get num page
num_page = pdf.numPages

# Start page, end page to split
start_page = int(input('Enter start page to split: '))
while start_page > num_page:
    print('Start page is greater than number of pages of file')
    start_page = int(input('Enter again: '))

end_page = int(input('Enter end page to split: '))
while end_page > num_page:
    print('End page is grater than number of pages of file')
    end_page = int(input('Enter again: '))

# Split
for page in range(start_page, end_page+1):
    pdf_writer.addPage(pdf.getPage(page))

# Write to new file
output_fname = input('Enter file out name: ')
with open(output_fname, 'wb') as out:
    pdf_writer.write(out)

print ('PDF file has been split!')

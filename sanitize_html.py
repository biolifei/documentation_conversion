#!/usr/bin/env python

import argparse
from bs4 import BeautifulSoup

parser = argparse.ArgumentParser(description='Remove some elements from doxygen generated html')
parser.add_argument('-f', '--file', required=True, help='HTML file to be parsed')

args = parser.parse_args()

f = open(args.file)
soup = BeautifulSoup(f)
header_div = soup.find('div', id='top')
header_div.extract()

footer_line = soup.find('hr', 'footer')
footer_line.extract()

images = soup.find('img')
print images
images.extract()

#print soup

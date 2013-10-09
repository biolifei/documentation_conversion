#!/usr/bin/env python

import argparse
from bs4 import BeautifulSoup

parser = argparse.ArgumentParser(description='Remove some elements from doxygen generated html')
parser.add_argument('-i', '--input', required=True, help='HTML file to be parsed')
parser.add_argument('-o', '--output', required=True, help='cleaned HTML file for output')

args = parser.parse_args()

old_file = open(args.input)
soup = BeautifulSoup(old_file)
header_div = soup.find('div', id='top')
header_div.extract()

footer_line = soup.find('hr', 'footer')
footer_line.extract()

images = soup.find('img')
images.extract()
old_file.close()

new_html = soup.prettify("utf-8")
new_file = open(args.output, 'w')
new_file.write(new_html)

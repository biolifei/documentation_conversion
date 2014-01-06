#!/usr/bin/env python

import argparse
import re

parser = argparse.ArgumentParser(description='Remove some elements from doxygen generated html')
parser.add_argument('-i', '--input', required=True, help='markdown file to be parsed')
parser.add_argument('-o', '--output', required=True, help='cleaned markdown output')

args = parser.parse_args()

#make fragments into code blocks
fragment_pattern = re.compile('~~*')

#Remove the Generated on line
generated_pattern = re.compile('Generated on*')

#Remove the "New_Library contains code for this purpose" line
new_lib_pattern = re.compile(r'New\\_Library contains code')

#Convert file name to page title
title=args.input.split('/')[-1].split('.')[0].replace("_", " ").title()

old_file = open(args.input)
new_file = open(args.output, 'w')

#add the page title to the first line of the new file
new_file.write("<!-- --- title: " + title + " -->")
for line in old_file:
	if fragment_pattern.match(line):
		line = "```\n"
		new_file.write(line)
	elif generated_pattern.match(line):
		#do nothing, removes the line
		line = ""
	elif new_lib_pattern.match(line):
		line = "Application purpose\n"
		new_file.write(line)
	else:
		line = line.replace(' .nosp@m. ', '')
		new_file.write(line)

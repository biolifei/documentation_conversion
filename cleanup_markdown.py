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

old_file = open(args.input)
new_file = open(args.output, 'w')
for line in old_file:
	if fragment_pattern.match(line):
		line = "```"
		new_file.write(line)
	elif generated_pattern.match(line):
		#do nothing, removes the line
		line = ""
	else:
		new_file.write(line)
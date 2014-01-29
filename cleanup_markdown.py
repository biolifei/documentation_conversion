#!/usr/bin/env python

import argparse
import re

parser = argparse.ArgumentParser(description='Remove some elements from doxygen generated html')
parser.add_argument('-i', '--input', required=True, help='markdown file to be parsed')
parser.add_argument('-o', '--output', required=True, help='cleaned markdown output')

args = parser.parse_args()

#make fragments into code blocks
fragment_pattern = re.compile('~~~~*')

#Remove the Generated on line
generated_pattern = re.compile('Generated on*')

#Remove the "New_Library contains code for this purpose" line
new_lib_pattern = re.compile(r'New\\_Library contains code')

#Pattern to change Markdown style links to Gollum style links
# - note use of non-greedy star and the grouping of the before and after
# The not-colon is to avoid translating absolute mailto links, which need the markdown syntax.
md_link_pattern = re.compile(r'''
\[(.*?)\]     # The link text, stored as group \1
\(            # The start parenthesis for the target
([^:]*?)      # The relative link target, stored as group \2
([ ]".*?")?   # The optional title text in quotes
\)            # The closing paren for the target block.
''', re.VERBOSE) # Allow these comments and multiline.

def md_link_sub( match ):
    text = match.groups()[0] # Why is this off by one? Who knows
    text = text.replace('\_','_').replace('\#','#')
    target = match.groups()[1]
    if target.startswith("#"):
        return match.string[match.start():match.end()] #Relative links need markdown style
    else:
        return '[['+text+'|'+target+']]'

#Convert file name to page title
title=args.input.split('/')[-1].split('.')[0].replace("_", " ").title()

old_file = open(args.input)
new_file = open(args.output, 'w')

#add the page title to the first line of the new file
new_file.write("<!-- --- title: " + title + " -->")
for line in old_file:
        if md_link_pattern.search(line):
            #Assume link isn't split across lines.
            line = md_link_pattern.sub( md_link_sub, line )

	if fragment_pattern.match(line):
                #print "Substituting code for 'fragment' in", args.input
                #print "            ", line.strip()
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

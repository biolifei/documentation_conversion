#!/usr/bin/env python

import argparse
from bs4 import BeautifulSoup

f = open('wiki_pages.txt')
wiki_pages = [l.strip() for l in f.readlines()]
f.close()

f = open('deleted_pages.txt')
deleted_pages = [l.strip() + '.html' for l in f.readlines()]
f.close()

parser = argparse.ArgumentParser(description='Remove some elements from doxygen generated html')
parser.add_argument('-i', '--input', required=True, help='HTML file to be parsed')
parser.add_argument('-o', '--output', required=True, help='cleaned HTML file for output')

args = parser.parse_args()

old_file = open(args.input)
soup = BeautifulSoup(old_file)
header_div = soup.find('div', id='top')
if header_div is not None:
    header_div.extract()

footer_line = soup.find('hr', 'footer')
if footer_line is not None:
    footer_line.extract()

images = soup.find('img')
if images is not None:
    images.extract()

#HTML from mediawiki issues
toc_tag = soup.find('table', id="toc")
if toc_tag is not None:
    toc_tag.extract()

for a in soup.find_all('a', href=True):
    if a['href'].startswith("https://wiki.rosettacommons.org/index.php/"):
        # Replace links to wiki pages with internal links, but only if they're converted.
        linkpage = a['href'][len("https://wiki.rosettacommons.org/index.php/"):]
        splitlink = linkpage.split('#')
        if splitlink[0].strip() not in wiki_pages:
            print "WARNING: Wiki page", splitlink[0], "referenced but not converted."
        else:
            #Handle renaming issue.
            splitlink[0] = splitlink[0].replace('_','-').replace('(','').replace(')','')
            a['href'] = '#'.join(splitlink)
    elif a['href'] in deleted_pages:
        #If the page is deleted, remove the link, but keep the text of the link.
        a.replace_with(' '.join(a.contents))
    elif '/' not in a['href']:
        splitlink = a['href'].split('#')
        if splitlink[0].endswith('.html'):
            #Turn relative links into proper page links - with dashes per preference (both page and anchor)
            splitlink[0] = splitlink[0][:-5]
            a['href'] = '#'.join(splitlink).replace('_','-')

old_file.close()

new_html = soup.prettify("utf-8")
new_file = open(args.output, 'w')
new_file.write(new_html)

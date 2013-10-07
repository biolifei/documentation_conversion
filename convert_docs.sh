#!/usr/bin/env sh
# Clean out the existing docs.
#rm -rf html
#rm -rf markdown

# Build the doc html
#doxygen

# Convert to github-flavored markdown
FILES=$(find html -type f -name *.html)
for f in $FILES
do
	markdown_name=`echo ${f} | cut -d'.' -f1 | sed s/html/markdown/`
	echo $markdown_name	
	pandoc -f html -t markdown_github -o ${markdown_name}.md ${f}
done

#for i in `ls *.html | cut -d'.' -f1`; do pandoc -f html -t markdown_github -o ${i}.md ${i}.mediawiki


#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "Please provide a path to the desired gollum"
	exit
fi

if [ ! -d "$1" ]; then
	echo "The directory specified for the new git repository does not exist. Please create it first"
	exit
fi

# Clean out the existing docs.
#rm -rf html
#rm -rf markdown

# Build the doc html
#doxygen

# Convert to github-flavored markdown
FILES=$(find html -type f -name *.html)
for f in $FILES
do
	basename=`echo ${f} | cut -d'.' -f1 | sed s/html//`
	markdown_name="$1$basename.md"
	echo "converting file: ${f}"
	iconv -f utf8 -t utf8 -c ${f} > ${f}.clean
	pandoc -f html -t markdown_github -o ${markdown_name} ${f}.clean
done

#for i in `ls *.html | cut -d'.' -f1`; do pandoc -f html -t markdown_github -o ${i}.md ${i}.mediawiki


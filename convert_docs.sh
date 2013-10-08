#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "Please provide a path to the desired gollum"
	exit
fi

if [ -d "$1" ]; then
	echo "The directory specified for the new git repository already exists. Aborting"
	exit
fi

# Clean out the existing docs.
#rm -rf html
#rm -rf markdown

# Build the doc html
#doxygen

# Convert to github-flavored markdown. First remove all non-UTF8 characters with iconv
mkdir $1
FILES=$(find html -type f -name *.html)
for f in $FILES
do
	basename=`echo ${f} | cut -d'.' -f1 | sed s/html//`
	markdown_name="$1$basename.md"
	echo "converting file: ${f}"
	iconv -f utf8 -t utf8 -c ${f} > ${f}.clean
	pandoc -f html -t markdown_github -o ${markdown_name} ${f}.clean
done

#Copy manually created Home page and images directory to new repo
cp -r images $1
cp Home.md $1


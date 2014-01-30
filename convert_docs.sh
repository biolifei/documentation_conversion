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
#rm -rf html/
rm -rf markdown/

# Build the doc html

if [ ! -d 'wiki' ]; then
  mkdir wiki/
  ./get_wiki.sh
fi

if [ ! -d 'html' ]; then
  doxygen
fi

# Convert to github-flavored markdown. First remove all non-UTF8 characters with iconv
# and cleanup specific html items with custom script
mkdir markdown
FILES=$(find html wiki -type f -name *.html)
for f in $FILES; do
	echo "converting file: ${f}"

	#Cleanup the HTML
	#check for iconv dialect
	iconv -l | grep utf8
	if [ $? -eq 0 ]; then
		format=utf8
	else
		format=UTF-8
	fi
	iconv -f ${format} -t ${format} -c "${f}" > "${f}.no_utf"
	./sanitize_html.py -i "${f}.no_utf" -o "${f}.clean"	

	#Convert to markdown
	markdown_name=`echo "${f}" | cut -d'.' -f1 | sed -e s/html/markdown/ -e s/wiki/markdown/`
	pandoc -f html -t markdown_github -o "${markdown_name}.md.dirty" "${f}.clean"

	#Cleanup the markdown
	./cleanup_markdown.py -i "${markdown_name}.md.dirty" -o "${markdown_name}.md"
	rm "${markdown_name}.md.dirty"

done

./organize_repo.sh

#Copy manually created Home page and images directory to new repo
mkdir $1
cp -ir images $1
cp -ir wiki/images $1
cp -ir markdown/* $1
rm -rf ${1}/junk/
cp -ir handwritten/* $1
cp -ir doc/full-options-list.md ${1}
cp -i remove_internal.py $1

cd $1
git init
git add .
git commit -m "Initial commit"


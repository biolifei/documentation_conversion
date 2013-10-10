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
# and cleanup specific html items with custom script
FILES=$(find html -type f -name *.html)
for f in $FILES; do
	echo "converting file: ${f}"

	#Cleanup the HTML
	iconv -f utf8 -t utf8 -c ${f} > ${f}.no_utf
	./sanitize_html.py -i ${f}.no_utf -o ${f}.clean	

	#Convert to markdown
	markdown_name=`echo ${f} | cut -d'.' -f1 | sed s/html/markdown/`
	pandoc -f html -t markdown_github -o ${markdown_name}.md.dirty ${f}.clean

	#Cleanup the markdown
	./cleanup_markdown.py -i ${markdown_name}.md.dirty -o ${markdown_name}.md
	rm ${markdown_name}.md.dirty

done

./organize_repo.sh

#Copy manually created Home page and images directory to new repo
#mkdir $1
#cp -r images $1
#cp -r markdown $1
#cp Home.md $1

#cd $1
#git init
#git add .
#git commit -m "Initial commit"


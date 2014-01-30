#!/usr/bin/env bash

#Read each line of wiki_pages.txt file into array
IFS=$'\n' read -d '' -r -a wiki_pages < ./wiki_pages.txt
IFS=$'\n' read -d '' -r -a wiki_images < ./wiki_images.txt

cd wiki
mkdir -p images

old_wiki_pages=(\
RosettaScripts_Documentation \
"Movers_(RosettaScripts)" \
"Filters_(RosettaScripts)" \
"TaskOperations_(RosettaScripts)" \
)

echo "Enter Username for RosettaCommons Wiki:"
read user
echo "Enter Password for RosettaCommons Wiki:"
read password

if [ ! -z "${user}" ]; then
    for p in "${wiki_pages[@]}"; do
        outname=`echo ${p}` # | sed -e 's/(//g' -e 's/)//g'`

	## Getting the raw WikiText involes a host of conversion issues.
	## MediaWiki knows how to parse it, so just get MediaWiki to render the page directly to HTML
	## wget "https://wiki.rosettacommons.org/index.php?action=raw&title="${p} --user=${user} --password=${password} -O ${outname}.mw
	wget "https://wiki.rosettacommons.org/index.php?action=render&title="${p} --user=${user} --password=${password} -O "${outname}.html"
    done
    for p in "${wiki_images[@]}"; do
        outname="images/"`echo ${p} | cut -d '/' -f5`  
	wget "https://wiki.rosettacommons.org/"${p} --user=${user} --password=${password} -O "${outname}"
    done
fi

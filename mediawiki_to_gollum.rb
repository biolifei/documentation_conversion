#!/usr/bin/env ruby
require 'rubygems'
require 'hpricot'
require 'gollum-lib'
 
wiki = Gollum::Wiki.new('internal.wiki')
 
file = File.open("wiki-content.xml", "r")
 
doc = Hpricot(file)
 
doc.search('/mediawiki/page').each do |el|
  title = el.at('title').inner_text
  content = el.at('text').inner_text
  commit = { :message => "Import MediaWiki page #{title} into Gollum",
             :name => 'Tim Jacobs',
             :email => 'TimJacobs2@gmail.com' }
  begin
    puts "Writing page #{title}"
    wiki.write_page(title, :mediawiki, content, commit)
  rescue Gollum::DuplicatePageError => e
    p "Duplicate #{title}"
  end
end
 
file.close

#!/usr/bin/ruby -w

require 'rexml/document'
include REXML

xmlfilename = ARGV[0]
xmlfile = File.new(xmlfilename)
xmldoc = Document.new(xmlfile)

# Now get the root element
root = xmldoc.root
puts "Root element : " + root.attributes["shelf"]

# This will output all the movie titles.
xmldoc.elements.each("collection/movie"){ 
   |e| puts "Movie Title : " + e.attributes["title"] 
}

# This will output all the movie types.
xmldoc.elements.each("collection/movie/type") {
   |e| puts "Movie Type : " + e.text 
}

# This will output all the movie description.
xmldoc.elements.each("collection/movie/description") {
   |e| puts "Movie Description : " + e.text 
}
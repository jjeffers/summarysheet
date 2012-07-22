#!/usr/bin/ruby -w
require "prawn"
require_relative 'lib/summarysheet'
filenames = Dir.glob("*.dnd4e")


Prawn::Document.generate("summary.pdf") do
  
  table_index = 0
  row = 0
  
  x = 0
  y = 700
  font_size 10
  filenames.each do |filename|
    sheet = Summary.new(File.new filename)
    
    bounding_box [x, y], :width => 300, :height => 200 do 
      table_data = [ ["Name", "Class", "Level"],
       [sheet.name, sheet.class, sheet.level ],
       ["Defenses"],
       ["AC", "FORT", "REF", "WILL"],
       [sheet.ac, sheet.fort, sheet.ref, sheet.will],
       [sheet.initiative, "Initiative"],
       [sheet.passive_perception, "Passive Perception"],
       [sheet.passive_insight, "Passive Insight"]]
       
      table(table_data) do
        #row(0).borders = [:bottom]
        row(0).border_width = 2
        row(0).font_style = :bold
        row(2).border_width = 2
        row(2).font_style = :bold
        row(3).border_width = 2
        row(3).font_style = :bold
        #columns(0..1).borders = [:right]
        #row(0).columns(0..1).borders = [:bottom, :right]
      end

    
    end

    table_index += 1
    
    if table_index %2 != 0
      x += 300
    else
      x = 0
      row += 1
    end
    
    y = 700 - (200*row)
  end
end
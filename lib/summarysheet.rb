require 'rexml/document'
include REXML

class SummarySheet
  
  attr_reader :name
  attr_reader :level
  attr_reader :class
  attr_reader :initiative
  attr_reader :ac
  attr_reader :fort
  attr_reader :ref
  attr_reader :will
  attr_reader :passive_perception
  attr_reader :passive_insight
  
  def initialize(xml_doc)

    @xmldoc = Document.new(xml_doc)
    
    root = @xmldoc.root
    @name = @xmldoc.elements["D20Character/CharacterSheet/Details/name"].text.strip
    @level= @xmldoc.elements["D20Character/CharacterSheet/Details/Level"].text.strip.to_i
    @class = @xmldoc.elements["D20Character/CharacterSheet/RulesElementTally/RulesElement[@type='Class']"].attributes["name"].strip
    @initiative = stat("Initiative")
    @ac = stat("AC")
    @fort = stat("Fortitude")
    @ref = stat("Reflex")
    @will = stat("Will")
    @passive_perception = stat("Passive Perception")
    @passive_insight = stat("Passive Insight")
                                   
  end
  
  def stat(name)
    @xmldoc.elements.each("D20Character/CharacterSheet/StatBlock/Stat") do |stat|
    
      stat_name = stat.elements["alias[@name='" + name + "']"]
     
      if not stat_name.nil?
        return stat.attributes["value"].to_i
      end
    end
  end
  
end

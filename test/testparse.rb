require "test/unit"
require_relative "../lib/summarysheet.rb"

class TestParsing < Test::Unit::TestCase
 
  def setup
    document = "<D20Character game-system=\"D&amp;D4E\" Version=\"0.07a\" legality=\"houserule\" >
       <!--
          Dungeons and Dragons Insider: Character Builder character save file
       -->


       <CharacterSheet>


          <Details>
             <name> Keyleth </name>
             <Level> 1 </Level>
             <Player>  </Player>
             <Height>  </Height>
             <Weight>  </Weight>
             <Gender>  </Gender>
             <Age>  </Age>
             <Alignment>  </Alignment>
             <Company>  </Company>
             <Portrait>  </Portrait>
             <Experience>  </Experience>
             <CarriedMoney> 79 gp </CarriedMoney>
             <StoredMoney>  </StoredMoney>
             <Traits>  </Traits>
             <Appearance>  </Appearance>
             <Companions>  </Companions>
             <Notes>  </Notes>
          </Details>
          <RulesElementTally>
            <RulesElement type=\"Class\" name=\"Mage\" />
          </RulesElementTally>
          <StatBlock>
                 <Stat value=\"0\" >
                    <alias name=\"Initiative\" />
                </Stat>
                <Stat value=\"15\" >
                        <alias name=\"AC\" />
                </Stat>
                <Stat value=\"12\" >
                        <alias name=\"Fortitude\" />
                </Stat>
                <Stat value=\"16\" >
                        <alias name=\"Reflex\" />
                </Stat>
                <Stat value=\"11\" >
                        <alias name=\"Will\" />
                </Stat>
                <Stat value=\"10\" >
                        <alias name=\"Passive Perception\" />
                </Stat>
                
                <Stat value=\"9\" >
                        <alias name=\"Passive Insight\" />
                </Stat>
          </StatBlock>
        </CharacterSheet>
      </D20Character>"
          
    @@summary = Summary.new(document)
    
  end
  
  def test_parse_name
    assert_equal("Keyleth", @@summary.name)
  end
  
  def test_parse_level
    assert_equal(1, @@summary.level)
  end
  
  def test_parse_class
    assert_equal("Mage", @@summary.class)
  end
  
  def test_parse_initiative
    assert_equal(0, @@summary.initiative)
  end
  
  def test_parse_ac
    assert_equal(15, @@summary.ac)
  end
  
  def test_parse_fort
    assert_equal(12, @@summary.fort)
  end
  
  def test_parse_ref
    assert_equal(16, @@summary.ref)
  end
  
  def test_parse_will
    assert_equal(11, @@summary.will)
  end
  
  def test_passive_perception
    assert_equal(10, @@summary.passive_perception)
  end
  
  def test_passive_insight
    assert_equal(9, @@summary.passive_insight)
  end

  
end
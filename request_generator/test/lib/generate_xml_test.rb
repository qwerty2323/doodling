require 'test/unit'
require_relative '../../lib/generate_xml'

class GenerateXMLTest < Test::Unit::TestCase
  def test_non_unique_name_part
    assert_equal(non_unique_name_part, correct_name_part,"#{correct_name_part} is generated")
  end

  def test_name_length
    assert_equal(XML.name.length, 105, "Name should be 105 characters")
  end

  def correct_name_part
    "ON_INFSOOB_0194202211019000000_0194202211019000000_6623_20170629_"
  end

  def non_unique_name_part
    XML.name.slice(0..64)
  end
end

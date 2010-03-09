require 'test_helper'

class TestLibxml4r < Test::Unit::TestCase
  
  should "check that libxml4r classes are loaded" do
    assert Libxml4r::XmlDocument
    assert Libxml4r::XmlNode
    assert Libxml4r::String
  end
  
  should "check that modules are included" do
    assert LibXML::XML::Document.included_modules.include? Libxml4r::XML::Document
    assert LibXML::XML::Node.included_modules.include? Libxml4r::XML::Node
    assert String.included_modules.include? Libxml4r::String
  end
  
  obj Libxml4r::XmlDocument::instance_methods do 
    should_include :node, :nodes # xml readers
    should_include :strip!, :last= # xml modifiers
    should_include :to_xml # xml outputters
  end

  obj Libxml4r::XmlNode::instance_methods do 
    should_include :node, :nodes # xml readers
    should_include :strip!, :last=, :replace! # xml modifiers
    should_include :to_xml, :inner_html # xml outputters
  end

  obj Libxml4r::XmlNode::SearchNodes::instance_methods do 
    should_include :[] # xml readers
  end
  
  obj Libxml4r::String::instance_methods do 
    should_include :to_xmldoc
  end
  
end


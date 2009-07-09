require 'test_helper'

class TestLibxmlBindings < Test::Unit::TestCase
  
  should "check that libxml-bindings classes are loaded" do
    assert LibxmlBindings::XmlDocument
    assert LibxmlBindings::XmlNode
    assert LibxmlBindings::String
  end
  
  should "check that modules are included" do
    assert LibXML::XML::Document.included_modules.include? LibxmlBindings::XML::Document
    assert LibXML::XML::Node.included_modules.include? LibxmlBindings::XML::Node
    assert String.included_modules.include? LibxmlBindings::String
  end
  
  obj LibxmlBindings::XmlDocument::instance_methods do 
    should_include :node, :nodes # xml readers
    should_include :strip!, :last= # xml modifiers
    should_include :to_xml # xml outputters
  end

  obj LibxmlBindings::XmlNode::instance_methods do 
    should_include :node, :nodes # xml readers
    should_include :strip!, :last=, :replace! # xml modifiers
    should_include :to_xml, :inner_html # xml outputters
  end

  obj LibxmlBindings::XmlNode::SearchNodes::instance_methods do 
    should_include :[] # xml readers
  end
  
  obj LibxmlBindings::String::instance_methods do 
    should_include :to_xmldoc
  end
  
end


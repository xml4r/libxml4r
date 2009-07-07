require 'test_helper'

class TestLibxmlBindings < Test::Unit::TestCase
  
  should "check that libxml-bindings are loaded" do
    assert LibxmlBindings::XmlDocument
    assert LibxmlBindings::XmlNode
    assert LibxmlBindings::String
  end
  
  should "check that modules are included" do
    assert XML::Document.included_modules.include? LibxmlBindings::XmlDocument
    assert XML::Node.included_modules.include? LibxmlBindings::XmlNode
    assert String.included_modules.include? LibxmlBindings::String
  end
  
  obj LibxmlBindings::XmlDocument::instance_methods do 
    should_include :strip!
  end

  obj LibxmlBindings::XmlNode::instance_methods do 
    should_include :/, :at, :inner_xml
  end
  
  obj LibxmlBindings::String::instance_methods do 
    should_include :to_libxml_doc
  end
  
end


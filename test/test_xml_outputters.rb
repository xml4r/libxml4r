require 'test_helper'

class TestXmlOutputters < Test::Unit::TestCase
  context "A namespaced xml document" do
    setup do
      # xml_file = "rss1.xml"
      xml_file = "ruby_lang.xhtml"
      
      # Load xml file
      xml_file = File.join(File.dirname(__FILE__), "xml", xml_file)
      assert ! xml_file.nil?

      @doc = XML::Document.file xml_file
      assert ! @doc.nil?
      
      @doc.strip! # Remove any namespaces

      @paths=[
        "/html/body/div[@id='page']"
        "/html/body//div[@id='intro']"
        ]
      
      @replacement_node = XML::Node.new("NameString","ContentString")
    end

    should "return the inner html of a valid xhtml node" do
      @paths.each do |path|
        inner_html = @doc.node[path].inner_html 
        inner_xml = @doc.node[path].inner_xml
        
        assert ! inner_html.nil?
        assert inner_html == inner_xml
      end
    end
    
    should "return an xml string of the node" do
      @paths.each do |path|
        xml_string = @doc.node[path].to_xml
        s = @doc.node[path].to_s
        assert ! xml_string.nil?
        assert xml_string == s
      end
    end
        
    should "return an xml string of the document" do
        xml_string = @doc.to_xml
        s = @doc.to_s
        assert ! xml_string.nil?
        assert xml_string == s
    end
        
  end
end

require 'test_helper'

class TestXmlModifiers < Test::Unit::TestCase
  context "A namespaced document" do
    setup do
      # choose xml file
      # xml_file = "namespaces.xml"
      # xml_file = "rss1.xml"
      # xml_file = "rubynet.xml"
      # xml_file = "shiporder.xml"
      xml_file = "soap_manufacturer_names_response.xml"
      # xml_file = "soap_create_reservation_response.xml"
      
      # Load xml file
      xml_file = File.join(File.dirname(__FILE__), "xml", xml_file)
      assert ! xml_file.nil?

      # doc_str = File.open( xml_file, "rb").read
      # @doc = doc_str.to_xmldoc
      @doc = XML::Document.file xml_file
      assert ! @doc.nil?
      
      # Remove namespaces
      @doc.strip!
    end

    should "strip all namespaces from a document" do
      assert ! @doc.strip!.nil?
    end
  end
  
  context "a partially namespaced document" do
    setup do
      # Insert the root node of a namespaced document into a stripped document
    end
    
    # should "replace a node within a document" do
    #   assert ! @doc.strip!.nil?
    # end

    # should "replace a node which is the root node of the document" do
    #   assert ! @doc.strip!.nil?
    # end
  end
    
  context "a stripped document" do
    
    should "strip all namespaces from a node" do
      @doc.node["/"]
      assert ! @node.strip!.nil?
    end
    
  end

end



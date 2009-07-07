require 'test_helper'

class TestNamespaces < Test::Unit::TestCase
  context "A namespaced xml document" do
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
      # @doc = doc_str.to_libxml_doc
      @doc = XML::Document.file xml_file
      assert ! @doc.nil?
      
      # Remove namespaces
      @doc.strip!
    end

    # should "strip all namespaces from document" do
    #   assert ! @doc.strip!.nil?
    # end

    context "with a node in any namespace" do
      should "find node" do
        # path="/Envelope/Body"
        # path="getManufacturerNamesResponse"
        # path="IDAndNameList" 
        # path="IDAndName" 
        
        # path="/Envelope/Body/getManufacturerNamesResponse/IDAndNameList"
        # path="/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName"
        # path="/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName/id"
        path="/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName/name"


        puts "=="
        # node = @doc.find_first(path)
        node = @doc/path
        puts node
        puts "=="
        node = @doc[path]
        puts node
        
        
      end
    end
        
  end
end



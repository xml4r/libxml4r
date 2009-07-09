require 'test_helper'

class TestXmlReaders < Test::Unit::TestCase
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
      # @doc = doc_str.to_xmldoc
      @doc = XML::Document.file xml_file
      assert ! @doc.nil?
      
      @doc.strip! # Remove any namespaces

      # path="/Envelope/Body"
      # path="getManufacturerNamesResponse"
      # path="IDAndNameList" 
      # path="IDAndName" 
      @paths=[
        "/Envelope/Body/getManufacturerNamesResponse/IDAndNameList",
        "/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName",
        "/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName/name",
        "/Envelope/Body/getManufacturerNamesResponse/IDAndNameList/IdAndName/name/id",
        ]
      
      @replacement_node = XML::Node.new("NameString","ContentString")
    end

    context "with any valid syntax xpath expression" do
      should "return the first matching node" do
        @paths.each do |path|
          # node = @doc.node[path]
          # puts "node=#{node}"
          assert ! node.nil?
        end
      end
      should "return an array of matching nodes" do
        @paths.each do |path|
          # nodes = @doc.nodes[path]
          # puts "nodes=#{nodes}"
          assert ! node.nil?
        end
      end
    end
        
  end
end



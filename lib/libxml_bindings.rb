require "xml/libxml"
module LibxmlBindings

  module XmlDocument

    def last=(node)
      self.last? ? self.root.sibling=node : self.root = node
    end

    # def node[](xpath)
    #   self.root.at(xpath)
    # end

    def at(xpath)
      self.root.at(xpath)
    end

    def search(xpath)
      self.root.search(xpath)
    end
    
    def to_xml
      self.root.to_xml
    end

    def strip_namespaces!
      # Parse xml
      xml_str = self.to_s
      # puts "xml_str=#{xml_str}\\n"
      xml_str.gsub! /\ ?(soap|xmlns)(:\w*)?=\"[^\"]*\"/, ""
      xml_str.gsub! /\<\w*:/, "<"
      xml_str.gsub! /\<\/\w*:/, "</"
      # puts "xml_str=#{xml_str}\\n"
      xml_doc_stripped = xml_str.to_libxml_doc
      self.root = xml_doc_stripped.root.copy(true)
      return self
    end
    
    alias_method :strip!, :strip_namespaces!
    alias_method :[],:search
    alias_method :/,:at
    # alias_method :node[],:at
  end

  module XmlNode
    ##
    # Open up XML::Node from libxml for convenience methods inspired by hpricot.
    # http://code.whytheluckystiff.net/hpricot/wiki/HpricotBasics
    #  * better handling of default namespaces
    # an array of default namespaces to past into
    attr_accessor :default_namespaces
    
    # find the child node with the given xpath
    def at(xpath)
      self.find_first(xpath)
    end

    # find the array of child nodes matching the given xpath
    def search(xpath)
      results = self.find(xpath).to_a
      if block_given?
        results.each do |result|
          yield result
        end
      end
      return results
    end

    alias_method :[],:search
    alias_method :/,:at

    # return the inner contents of this node as a string
    def inner_xml
      child.to_s
    end

    # alias for inner_xml
    def inner_html
      inner_xml
    end

    # return this node and its contents as an xml string
    def to_xml
      self.to_s
    end

    # # alias for path
    # def xpath
    #   self.path
    # end

  end

  module String
    def to_xmldoc
      return XML::Parser.string(self).parse
    end
    alias_method :to_libxml_doc, :to_xmldoc
  end
  
end

# Mix into the ruby std classes
class XML::Document
  include LibxmlBindings::XmlDocument
end

class XML::Node
  include LibxmlBindings::XmlNode
  
  # alias_method :find_base, :find unless method_defined?(:find_base)
  # alias_method :find, :find_with_default_ns
  # alias_method :find_first_base, :find_first unless method_defined?(:find_first_base)
  # alias_method :find_first, :find_first_with_default_ns
  
end

class String
  include LibxmlBindings::String
end


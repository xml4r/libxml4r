require "xml/libxml"

# @private
class Module
  alias_method :method_alias, :alias_method
end

module Libxml4r::XML::Document

  # :call-seq:
  #   doc.last = node -> XML::Node
  #
  # Appends +node+ to the end of the list of nodes at this level
  def last=(node)
    self.last? ? self.root.sibling=node : self.root = node
  end

  # :call-seq:
  #   doc.node["/xpath"] -> XML::Node
  #
  # Returns the first Node object matching +"/xpath"+, or +nil+ if no object could not be found.
  # 
  # *Note* its usually recommended to remove all namespaces with strip! before xpath traversal.
  def node()
    self.root.node()
  end

  def node_at(xpath) #:nodoc:
    self.root.node_at(xpath)
  end

  # :call-seq:
  #   doc.nodes["/xpath"] -> [XML::Node, XML::Node, XML::Node, ...]
  #
  # Returns an array containing all nodes matching +"/xpath"+, or +nil+ if no object could not be found.
  # 
  # *Note* its usually recommended to remove all namespaces with strip! before xpath traversal.
  def nodes()
    self.root.nodes()
  end

  def nodes_at(xpath) #:nodoc:
    self.root.search(xpath)
  end

  # :call-seq:
  #   doc.strip! -> XML::Document
  #   doc.strip_namespaces! -> XML::Document
  #
  # Strip all namespaces from this XML::Document.
  # replaces the root node with a stripped XML::Node (and children)
  # 
  # *Note* Xml elements with a namespace context are usually omited from xpath search criteria. 
  #  
  # See: http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/XPath.html
  def strip!
    # Parse xml
    xml_str = self.to_s
    # puts "xml_str=#{xml_str}\\n"
    xml_str.gsub! /\ ?(soap|xmlns)(:\w*)?=\"[^\"]*\"/, ""
    xml_str.gsub! /\<\w*:/, "<"
    xml_str.gsub! /\<\/\w*:/, "</"
    # puts "xml_str=#{xml_str}\\n"
    xml_doc_stripped = xml_str.to_xmldoc
    self.root = xml_doc_stripped.root.copy(true)
    return self
  end
  alias_method :strip_namespaces!, :strip!

  # :call-seq:
  #   doc.to_xml -> String
  # 
  # Alias for XML::Document.to_s[http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/Document.html#M000458]
  def to_xml
    return self.to_s
  end
  # alias_method :to_xml, :to_s

end

module Libxml4r::XML::Node

  # @private
  class SearchNodes
    def initialize(options)
      @node = options[:node]
      @return_many = options[:return_many]
    end
    def [](args)
      @return_many ? @node.nodes_at(args) : @node.node_at(args)
    end
  end

  # :call-seq:
  #   self.inner_html -> String
  # 
  # Alias for XML::Node.inner_xml[http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/Node.html#M000188]
  def inner_html
    self.inner_xml
  end
  # alias_method :inner_html, :inner_xml

  # :call-seq:
  #   self.last = XML::Node -> XML::Node
  # 
  # Alias for XML::Node.sibling=[http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/Node.html#M000223]
  def last=(node)
    return self.sibling = node
  end
  # alias_method :last=, :sibling=
    
  # :call-seq:
  #   self.node["/xpath"] -> XML::Node
  #
  # Returns the first Node object matching +"/xpath"+, or +nil+ if no object could not be found.
  # The path searched is relative to the node from which node[] was called.
  # 
  # *Note* its usually recommended to remove all namespaces with strip! before xpath traversal.
  def node()
    return SearchNodes.new(:node => self, :return_many => false)
  end

  def node_at(xpath) #:nodoc:
    self.find_first(xpath)
  end

  # :call-seq:
  #   self.nodes["/xpath"] -> [XML::Node, XML::Node, XML::Node, ...]
  #
  # Returns an array containing all nodes matching +"/xpath"+, or +nil+ if no object could not be found.
  # The path searched is relative to the node from which node[] was called.
  # 
  # *Note* its usually recommended to remove all namespaces with strip! before xpath traversal.
  def nodes()
    return SearchNodes.new(:node => self, :return_many => true)
  end

  def nodes_at(xpath) #:nodoc:
    results = self.find(xpath).to_a
    if block_given?
      results.each do |result|
        yield result
      end
    end
    return results
  end

  # # :call-seq:
  # #   self.replace!(other_node) -> XML::Node
  # # 
  # # Replaces the current XML::Node with +other_node+.
  # # remove! is called on self, and it's handle will become lost.
  # def replace!(other_node)
  #   node_node_parent = parent if parent?
  #   new_node_doc = self.doc if ! parent?
  #   self.remove!
  #   doc.root = other_node if new_node_doc
  #   parent << other_node if parent
  #   return other_node
  # end

  # # :call-seq:
  # #   self.strip! -> XML::Node
  # #   self.strip_namespaces! -> XML::Node
  # #
  # # Strip namespaces from this XML::Node and all its children.
  # # replaces this XML::Node with the stripped XML::Node (and children)
  # # 
  # # *Note* Xml elements with a namespace context are usually omited from xpath search criteria. 
  # #  
  # # See: http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/XPath.html
  # def strip!
  #   # Parse xml
  #   xml_str = self.to_s
  #   # puts "xml_str=#{xml_str}\\n"
  #   xml_str.gsub! /\ ?(soap|xmlns)(:\w*)?=\"[^\"]*\"/, ""
  #   xml_str.gsub! /\<\w*:/, "<"
  #   xml_str.gsub! /\<\/\w*:/, "</"
  #   # puts "xml_str=#{xml_str}\\n"
  #   xml_node_stripped = xml_str.to_xmldoc
  #   new_node = xml_doc_stripped.root.copy(true)
  #   self.replace new_node
  #   return new_node
  # end
  # 
  # alias_method :strip_namespaces!, :strip!

  # :call-seq:
  #   self.to_xml -> String
  # 
  # Alias for XML::Node.to_s[http://libxml.rubyforge.org/rdoc/classes/LibXML/XML/Node.html#M000216]
  def to_xml
    return self.to_s
  end

  # alias_method :to_xml, :to_s
end
  
module Libxml4r::String
  # :call-seq:
  #   str.to_xmldoc -> XML::Document
  #
  # Returns an XML Document object, or +nil+ if str could not be parsed as valid xml.
  # 
  # The resulting libxml instance can be parsed, manipulated, and converted back to a string.
  def to_xmldoc
    return ::XML::Parser.string(self).parse
  end
end

# @private
class LibXML::XML::Document
  include ::Libxml4r::XML::Document
end

# @private
class LibXML::XML::Node
  include ::Libxml4r::XML::Node
end

# @private
class String
  include ::Libxml4r::String
end

require 'rubygems'
require 'test/unit'
require 'shoulda'
# require 'woulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'libxml4r'

class Test::Unit::TestCase


  def self.obj(object, &block)
    context "#{object.class} #{object.to_s}" do
      setup do
        @obj = object
      end

      context '' do
        yield
      end
    end
  end

  def self.should_include(*m)
    a = [m] if m.class == Symbol
    a = m if m.class == Array && m.first.class == Symbol
    raise "Requires a symbol, or array of symbols" if a.nil?
    a.each do |sym|
      should "include #{sym}" do
        # puts @obj
        # puts @obj.class
        assert @obj.include? sym.to_s
      end
    end
  end
  
end


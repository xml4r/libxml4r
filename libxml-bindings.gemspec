# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libxml-bindings}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["dreamcat4"]
  s.date = %q{2009-05-26}
  s.email = %q{dreamcat4@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/libxml-bindings.rb",
    "test/libxml_bindings_test.rb",
    "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dreamcat4/libxml-bindings}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Dreamcat4's bindings for libxml-ruby. In development. This gem will provide convenience functions for both reading and writing XML in ruby. Implemented as wrapper for underlying libxml2 / SAX. Aims are to be faster (very much) and simpler (little bit) than hpricot. This project is a continuation / extension of libxml_helper.rb by Phil Bogle.}
  s.test_files = [
    "test/libxml_bindings_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

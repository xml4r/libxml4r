require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "libxml-bindings"
    gem.summary = %Q{Dreamcat4's bindings on libxml-ruby. Convenience methods for extending the core classes.}
    gem.description = %Q{{libxml-bindings}[http://github.com/dreamcat4/libxml-bindings/tree/master] is a light set of methods and bolt-ons which aren't maintained by the core {libxml ruby library}[http://libxml.rubyforge.org/install.xml]. These methods aim to provide a more convenient API interface which is provided and documented separately, but actually mixed in to extend the original LibXML::classes. Using these methods should significantly reduce the lines of code needed to perform the most common operations of accessing and manipulating an xml document structure.}
    gem.email = "dreamcat4@gmail.com"
    gem.homepage = "http://github.com/dreamcat4/libxml-bindings"
    gem.authors = ["dreamcat4"]
    gem.add_dependency("libxml-ruby", ">= 1.1.3")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end
  # rdoc --help --webcvs, -W url
  # github_blob_url = "<%= github_url %>/blob/v#{version}/%s"
  # github_raw_url = "<%= github_url %>/raw/v#{version}/%s"
  # github_blob_url = "http://github.com/dreamcat4/libxml-bindings/blob/v#{version}/%s"
  # github_raw_url = "http://github.com/dreamcat4/libxml-bindings/raw/v#{version}/%s"
  # rdoc.options = ["--webcvs", "#{github_blob_url}"]
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "libxml-bindings #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


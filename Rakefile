require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "libxml4r"
    gem.summary = %Q{Libxml4r provides convenience methods around the core libxml-ruby classes.}
    gem.description = %Q{Libxml4r is a light set of methods and bolt-ons which aren't maintained by the core libxml ruby library. These methods aim to provide a more easy to use xml API. All libxml4r methods are mixed into the original LibXML::classes. (This gem was previously called libxml4r).}
    gem.email = "dreamcat4@gmail.com"
    gem.homepage = "http://github.com/dreamcat4/libxml4r"
    gem.authors = ["dreamcat4"]
    gem.add_dependency("libxml-ruby", ">= 1.1.3")
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_development_dependency "yard", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

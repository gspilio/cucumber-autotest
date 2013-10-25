# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'cucumber'
  s.version     = Autotest::CucumberMixin::VERSION
  #Could you fill in the authors list?
  s.authors     = ["Aslak Hellesøy"]
  s.description = 'Cucumber plugin for Autotest'
  s.summary     = "cucumber-autotest-#{s.version}"
  #Should the email stay the same or should I replace it with mine?
  s.email       = 'cukes@googlegroups.com'
  s.license     = 'MIT'
  s.homepage    = "http://cukes.info"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency 'cucumber', '>= 2.0'

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end

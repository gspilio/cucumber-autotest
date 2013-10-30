# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "cucumber/autotest/version"

Gem::Specification.new do |s|
  s.name        = 'cucumber-autotest'
  s.version     = Cucumber::Autotest::VERSION
  #Could you fill in the authors list?
  s.authors     = ["Aslak Hellesøy", "Peter Jaros", "Erik Michaels-Ober", "Niklas H", "Tobias Pape",
                   "Jean-Michel Garnier ", "Jonathan del Strother", "Darrick Wiebe", "Erik Hansson",
                   "Martin Mauch", "Johan Kiviniemi", "Matt Wynne", "Sytse Sijbrandij", "Giannis Spiliopoulos"]
  s.description = 'Cucumber plugin for Autotest'
  s.summary     = "cucumber-autotest-#{s.version}"
  #Should the email stay the same or should I replace it with mine?
  s.email       = 'cucumber.autotest@gmail.com'
  s.license     = 'MIT'
  #Switch it with the github's repo url?
  s.homepage    = "https://github.com/gspilio/cucumber-autotest/"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency 'cucumber', "> 1.3.8"
  s.add_dependency "ZenTest", "~> 4.6"

  s.add_development_dependency "debugger"

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end

# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: soroban 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "soroban".freeze
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Hutchens".freeze]
  s.date = "2021-10-13"
  s.description = "Soroban makes it easy to extract and execute formulas from Excel spreadsheets. It rewrites Excel formulas as Ruby expressions, and allows you to bind named variables to spreadsheet cells to easily manipulate inputs and capture outputs.".freeze
  s.email = "jason.hutchens@agworld.com.au".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    ".yardopts",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "files/Physics.xlsx",
    "lib/soroban.rb",
    "lib/soroban/cell.rb",
    "lib/soroban/errors.rb",
    "lib/soroban/functions.rb",
    "lib/soroban/functions/and.rb",
    "lib/soroban/functions/average.rb",
    "lib/soroban/functions/exp.rb",
    "lib/soroban/functions/if.rb",
    "lib/soroban/functions/ln.rb",
    "lib/soroban/functions/max.rb",
    "lib/soroban/functions/min.rb",
    "lib/soroban/functions/not.rb",
    "lib/soroban/functions/or.rb",
    "lib/soroban/functions/sum.rb",
    "lib/soroban/functions/vlookup.rb",
    "lib/soroban/helpers.rb",
    "lib/soroban/import.rb",
    "lib/soroban/import/ruby_xl_importer.rb",
    "lib/soroban/import/ruby_xl_patch.rb",
    "lib/soroban/label_walker.rb",
    "lib/soroban/parser.rb",
    "lib/soroban/parser/grammar.rb",
    "lib/soroban/parser/grammar.treetop",
    "lib/soroban/parser/nodes.rb",
    "lib/soroban/parser/rewrite.rb",
    "lib/soroban/sheet.rb",
    "lib/soroban/value_walker.rb",
    "soroban.gemspec",
    "spec/documentation_spec.rb",
    "spec/import_spec.rb",
    "spec/soroban_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/agworld/soroban".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Soroban is a calculating engine that understands Excel formulas.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<treetop>.freeze, ["~> 1.5.3"])
    s.add_development_dependency(%q<rubyXL>.freeze, ["~> 3.4.18"])
  else
    s.add_dependency(%q<treetop>.freeze, ["~> 1.5.3"])
    s.add_dependency(%q<rubyXL>.freeze, ["~> 3.4.18"])
  end
end


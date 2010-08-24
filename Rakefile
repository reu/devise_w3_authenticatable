require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the devise_w3 plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "devise_w3_authenticatable"
    gemspec.summary = "Devise IBM w3 authentication strategy"
    gemspec.description = "Devise strategy to authenticate against IBM w3 LDAP directory."
    gemspec.email = "reu@rnavarro.com.br"
    gemspec.homepage = "http://github.com/reu/devise_w3_authenticatable"
    gemspec.authors = ["Rodrigo Navarro"]
    gemspec.add_dependency "devise",      "~> 1.1"
    gemspec.add_dependency "nokogiri",    "~> 1.4.3.1"
    gemspec.add_dependency "net-ldap",    ">= 0.1.1"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

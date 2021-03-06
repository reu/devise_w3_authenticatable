# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{devise_w3_authenticatable}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rodrigo Navarro"]
  s.date = %q{2010-09-14}
  s.description = %q{Devise strategy to authenticate against IBM w3 LDAP directory.}
  s.email = %q{reu@rnavarro.com.br}
  s.files = [
    ".gitignore",
     "Rakefile",
     "VERSION",
     "devise_w3_authenticatable.gemspec",
     "lib/devise_w3_authenticatable.rb",
     "lib/devise_w3_authenticatable/model.rb",
     "lib/devise_w3_authenticatable/schema.rb",
     "lib/devise_w3_authenticatable/strategy.rb",
     "lib/devise_w3_authenticatable/w3_adapter.rb",
     "rails/init.rb",
     "test/devise_w3_authenticatable_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/reu/devise_w3_authenticatable}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Devise IBM w3 authentication strategy}
  s.test_files = [
    "test/devise_w3_authenticatable_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<devise>, ["~> 1.1"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.3.1"])
      s.add_runtime_dependency(%q<net-ldap>, [">= 0.1.1"])
    else
      s.add_dependency(%q<devise>, ["~> 1.1"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.3.1"])
      s.add_dependency(%q<net-ldap>, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<devise>, ["~> 1.1"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.3.1"])
    s.add_dependency(%q<net-ldap>, [">= 0.1.1"])
  end
end


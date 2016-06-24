$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_relation_remover/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "active_admin_relation_remover"
  spec.version     = ActiveAdminRelationRemover::VERSION
  spec.authors     = ["mmmpa"]
  spec.email       = ["mmmpa.mmmpa@gmail.com"]
  spec.homepage    = "http://mmmpa.net"
  spec.summary     = "TODO: Summary of ActiveAdminRelationRemover."
  spec.description = "TODO: Description of ActiveAdminRelationRemover."
  spec.license     = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rspec-html-matchers"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rb-readline"
end

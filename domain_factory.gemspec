$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "domain_factory/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "domain_factory"
  s.version     = DomainFactory::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/domain_factory.git"
  s.summary     = "Painless deployment to domainfactory."
  s.description = "Painless deployment to domainfactory."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "capistrano"
  s.add_dependency "capistrano-ext"

  s.add_development_dependency "sqlite3"
end

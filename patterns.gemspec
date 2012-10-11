$:.push File.expand_path(".", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "patterns"
  s.version     = "1.0"
  s.authors     = ["Marc-Andre Cournoyer"]
  s.email       = ["marc@codedinc.com"]
  s.homepage    = "http://owningrails.com/"
  s.summary     = 
  s.description = "The Patterns mini-framework"
  
  s.require_paths = %w( . )

  s.add_runtime_dependency 'sqlite3'
end

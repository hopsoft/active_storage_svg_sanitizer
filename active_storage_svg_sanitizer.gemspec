$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "active_storage_svg_sanitizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "active_storage_svg_sanitizer"
  spec.version = ActiveStorageSvgSanitizer::VERSION
  spec.authors = ["Nathan Hopkins"]
  spec.email = ["natehop@gmail.com"]
  spec.homepage = "https://github.com/hopsoft/active_storage_svg_sanitizer"
  spec.summary = "Sanitize SVG images after ActiveStorage upload"
  spec.description = "Sanitize SVG images after ActiveStorage upload"
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0"

  spec.add_development_dependency "sqlite3"
end

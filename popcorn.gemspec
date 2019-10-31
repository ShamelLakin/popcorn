
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/popcorn/version"

Gem::Specification.new do |spec|
  spec.name          = "popcorn_love"
  spec.version       = Popcorn::VERSION
  spec.date          = "2019-10-31"
  spec.authors       = ["'Shamel Lakin'"]
  spec.email         = ["'christlife4u@gmail.com'"]
  spec.summary       = "Tracking top box office movies"
  spec.description   = "Tracking top box office movies internationally"
  spec.homepage      = "https://github.com/ShamelLakin/popcorn"
  spec.license       = "MIT"

  spec.files         = ["lib/popcorn/cli.rb", "lib/popcorn/scraper.rb", "lib/popcorn/user.rb", "lib/popcorn/version.rb", "config/environment.rb" ]
  # Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # spec.bindir        = "bin"
  
  spec.executables << "popcorn"
  # spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

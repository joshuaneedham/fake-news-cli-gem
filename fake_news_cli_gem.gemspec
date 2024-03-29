lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_news_cli_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'fake_news_cli_gem'
  spec.version       = FakeNewsCliGem::VERSION
  spec.authors       = ['Joshua Needham']
  spec.email         = ['joshuabneedham@gmail.com']

  spec.summary       = "This gem scrapes FactCheck.org's /fake-news url."
  spec.description   = 'Quickly view the 10 latest FactCheck.org/fake-news articles using this Ruby CLI Gem.'
  spec.homepage      = 'https://github.com/joshuaneedham/fake-news-cli-gem.git.'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Development dependencies
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  # All environment dependencies
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'colorize'
end

# frozen_string_literal: true

require File.expand_path('lib/assoc_filter/version', __dir__)

Gem::Specification.new do |gem|
  gem.name          = 'assoc_filter'
  gem.summary       = 'summary' # TODO: Write gem summary
  gem.description   = 'description' # TODO: Write gem description
  gem.authors       = ['onlyno2']
  gem.email         = 'kiennd010498@gmail.com'
  gem.licenses      = ['MIT']
  gem.homepage      = ''

  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version       = '0.0.0'
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.5.6'

  gem.add_dependency 'activesupport', '~> 5.0'

  gem.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.2'
end

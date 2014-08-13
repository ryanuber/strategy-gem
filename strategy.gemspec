lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  files           = Dir.glob('**/*').reject { |f| File.directory? f }
  s.name          = 'strategy'
  s.version       = '0.1.1'
  s.summary       = 'Create runnable, stepped execution plans'
  s.description   = 'Create runnable, stepped plans to control execution'
  s.authors       = 'Ryan Uber'
  s.email         = 'ru@ryanuber.com'
  s.files         = files.grep(/^lib/)
  s.homepage      = 'https://github.com/ryanuber/strategy-gem'
  s.license       = 'MIT'
  s.test_files    = files.grep(/^spec/)
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.8'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end

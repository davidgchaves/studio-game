Gem::Specification.new do |s|
  s.name         = "my_awesome_game"
  s.version      = "1.0.0"
  s.author       = "David G. Chaves"
  s.email        = "davidgchaves@example.com"
  s.homepage     = "http://www.example.com"
  s.summary      = "Mind Blowing!!! Literally!!!"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=2.1'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
end

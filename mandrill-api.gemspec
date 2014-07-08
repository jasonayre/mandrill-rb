# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  s.name = 'mandrill-rb'
  s.version = Mandrill::VERSION
  s.summary = 'A Ruby API library for the Mandrill email as a service platform.'
  s.description = s.summary
  s.authors = ['Mandrill Devs']
  s.email = 'community@mandrill.com'
  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/jasonayre/mandrill-rb'
  s.add_dependency 'json', '>= 1.7.7', '< 2.0'
  s.add_dependency 'excon', '>= 0.16.0', '< 1.0'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end

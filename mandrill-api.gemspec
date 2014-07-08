Gem::Specification.new do |s|
  s.name = 'mandrill-rb'
  s.version = '1.0.52'
  s.summary = 'A Ruby API library for the Mandrill email as a service platform.'
  s.description = s.summary
  s.authors = ['Mandrill Devs']
  s.email = 'community@mandrill.com'
  s.files = ['lib/mandrill.rb', 'lib/mandrill/api.rb', 'lib/mandrill/errors.rb']
  s.homepage = 'https://github.com/jasonayre/mandrill-rb'
  s.add_dependency 'json', '>= 1.7.7', '< 2.0'
  s.add_dependency 'excon', '>= 0.16.0', '< 1.0'
end

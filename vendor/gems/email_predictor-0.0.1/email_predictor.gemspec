$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'email_predictor'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "This is an email predictor!"
  s.description = "Predict emails on a historical pattern for a company"
  s.authors     = ["ankit8898"]
  s.email       = 'ankit.gupta8898@gmail.com'
  s.files       = [
    "lib/email_predictor/data_analyser.rb",
    "lib/email_predictor/base.rb",
    "lib/email_predictor/predictor.rb",
    "lib/email_predictor/rules.rb",
    "lib/email_predictor.rb"
  ]
  s.homepage    = 'https://rubygems.org/gems/email_predictor'
  s.add_development_dependency 'rspec','~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'rspec-collection_matchers', '~> 1.1', '>= 1.1.2'
  s.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  s.add_development_dependency 'activesupport','~> 4.2', '>= 4.2.0'
  s.post_install_message = "Thanks for installing!"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_logger/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_logger"
  s.version     = ActsAsLogger::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lucas Renan", "Carlos Brando"]
  s.email       = ["contato@lucasrenan.com", "eduardobrando@gmail.com"]
  s.homepage    = "https://github.com/lucasrenan/acts-as-logger"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "acts_as_logger"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'activesupport', '~> 3.0.3'
  s.add_dependency 'mongoid',       '2.0.0.rc.4'
  s.add_dependency 'bson_ext',      '1.1.5'
end

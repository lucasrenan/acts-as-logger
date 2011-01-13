# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require 'rake/rdoctask'

require 'rake/testtask'
require 'launchy'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsLogger'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


#FIXME Rake test não funciona se implementar rcov
#FIXME rake rcov path está com problemas


task :rcov => "rcov:plain"

rcov_command = "bundle exec rcov -I *_test.rb **/*_test.rb --rails -x '.gem|case|helper'"

namespace :rcov do
  #FIXME Tenho que entrar na pasta test senão não consigo rodar o rcov
  FileUtils.cd('test')

  task :plain do
    system "#{rcov_command} --no-html -T"
  end

  task :web do
    system "#{rcov_command} -o dummy/public/coverage"
    Launchy.open("http://localhost:3000/coverage/index.html")
  end
end

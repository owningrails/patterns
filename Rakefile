require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << '.'
  t.libs << 'tests'
  t.pattern = 'tests/**/*_test.rb'
  t.verbose = true
end

task :default => :test
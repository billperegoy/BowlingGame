require 'rspec/core/rake_task'
require 'cane/rake_task'

RSpec::Core::RakeTask.new(:spec)

Cane::RakeTask.new(:quality)

task :default => [:spec, :quality]

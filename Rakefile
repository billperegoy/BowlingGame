require 'rspec/core/rake_task'
require 'cane/rake_task'

RSpec::Core::RakeTask.new(:spec)

Cane::RakeTask.new(:quality) do |cane|
  cane.no_doc = true
end

task :default => [:spec, :quality]

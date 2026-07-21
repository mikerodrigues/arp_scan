# frozen_string_literal: true

require 'fileutils'

spec = Gem::Specification.load(File.expand_path('arp_scan.gemspec', __dir__))
gem_file = "#{spec.name}-#{spec.version}.gem"

desc 'Build the gem into the pkg directory'
task :build do
  sh 'gem', 'build', spec.loaded_from
  FileUtils.mkdir_p('pkg')
  FileUtils.mv(gem_file, File.join('pkg', gem_file), force: true)
end

begin
  require 'rspec/core/rake_task'

  desc 'Run the test suite'
  RSpec::Core::RakeTask.new(:spec) do |task|
    task.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError
  desc 'Run the test suite'
  task :spec do
    abort 'rspec is not installed. Run bundle install.'
  end
end

desc 'Alias for the spec task'
task test: :spec

task default: :spec

# frozen_string_literal: true

require 'bundler/gem_helper'

Bundler::GemHelper.install_tasks

def bundle_executable
  @bundle_executable ||= %w[bundle bundle3.2].find do |command|
    system('which', command, out: File::NULL, err: File::NULL)
  end
end

desc 'Run the test suite'
task :spec do
  bundle = bundle_executable
  abort 'bundler is not installed. Run bundle install.' unless bundle

  Dir.chdir(File.join(__dir__, 'spec')) do
    sh bundle, 'exec', 'rspec', '.'
  end
end

desc 'Alias for the spec task'
task test: :spec

task default: :spec

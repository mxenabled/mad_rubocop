# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

::Rake::Task["default"].clear if ::Rake::Task.task_defined?("default")
task :default => [:rubocop, :spec]

desc "Run specs"
::RSpec::Core::RakeTask.new(:spec)

desc "Run RuboCop"
task :rubocop do
  ::RuboCop::RakeTask.new
end

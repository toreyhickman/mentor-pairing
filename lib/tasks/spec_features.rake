if $LOAD_PATH.any? { |p| p.include? "rspec" }
  require 'rspec/core/rake_task'
  namespace :spec do
    desc "loads and runs only feature tests"
    RSpec::Core::RakeTask.new(:features => "test:prepare") do |task|
      task.pattern = "./spec/**/*_feature.rb"
    end
    desc "Run all specs"
    task :all => [:spec, :features]
  end
end

#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Dorian::Application.load_tasks

desc 'Expires everything so that pages show fresher timestamps'
task :expire => :environment do
  App.module_instances do |mod|
    mod.expire
  end
end

desc 'Deploys a new secret token to config/initializers/secret_token.rb'
task :secret_deploy do
  secret = `rake secret`.strip
  token_file = 'config/initializers/secret_token.rb'
  File.open(token_file, 'w') do |file|
    file.puts File.read(token_file + ".example").gsub(/<secret token>/, secret)
  end
  puts "Wrote secret to #{token_file}"
end

desc 'Update data from source for all modules (e.g. Goodreads, Twitter, etc.)'
task :update => :environment do
  App.module_instances do |mod|
    mod.update
  end
end

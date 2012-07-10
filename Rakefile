#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Dorian::Application.load_tasks

desc 'Expires everything so that pages show fresher timestamps'
task :expire => :environment do
  Slides.log :cache_clear do
    Rails.cache.clear
  end
end

desc 'Update data from source for all modules (e.g. Goodreads, Twitter, etc.)'
task :update => :environment do
  Slides.log :update do
    App.module_instances do |mod|
      Slides.log :update, module: mod.class.name do
        begin
          mod.update
        rescue
          $stderr.puts "update_error module=#{mod.class.name} message=#{$!.message}"
        end
      end
    end
    Slides.log :cache_clear do
      Rails.cache.clear
    end
  end
end

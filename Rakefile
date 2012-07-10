#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'timeout'

require File.expand_path('../config/application', __FILE__)

Dorian::Application.load_tasks

# use timeouts in here specifically because occasionally memcache takes a very
# long time to respond and starts eating task time (i.e. dyno-hours)

def clear_cache
  Slides.log :cache_clear do
    Timeout.timeout(1) do
      begin
        Rails.cache.clear
      rescue
        $stderr.puts "error message=#{$!.message}"
      end
    end
  end
end

desc 'Expires everything so that pages show fresher timestamps'
task :expire => :environment do
  clear_cache
end

desc 'Update data from source for all modules (e.g. Goodreads, Twitter, etc.)'
task :update => :environment do
  Slides.log :update do
    App.module_instances do |mod|
      Slides.log :update, module: mod.class.name do
        begin
          Timeout.timeout(15) do
            mod.update
          end
        rescue
          $stderr.puts "error module=#{mod.class.name} message=#{$!.message}"
        end
      end
    end
    clear_cache
  end
end

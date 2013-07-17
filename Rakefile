#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DbcOverflow::Application.load_tasks

desc 'Stop Drop and Load'
task "reset" do
  exec "rake db:drop db:create db:migrate db:seed"
end

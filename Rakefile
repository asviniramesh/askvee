#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Askvee::Application.load_tasks
load File.join(Rails.root, Dir["vendor/plugins/login/login.rake"])

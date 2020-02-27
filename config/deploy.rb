# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"
set :application, "sawia"
set :repo_url, "git@github.com:karazlab/swyya.git"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads", "vendor/bundle"
append :linked_files, "config/database.yml", "config/secrets.yml"

set :nginx_server_name, "localhost #{fetch(:application)}.local stg.shiftmanager.visunware.com"

set :rvm_type, :user
set :rvm_ruby_version, '2.4.2@shift-manager'

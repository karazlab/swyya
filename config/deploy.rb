# config valid for current version and patch releases of Capistrano
lock "~> 3.12.0"

set :application, "sawia"
set :repo_url, "git@github.com:karazlab/swyya.git"
set :branch, "production"

# Deploy to the user's home directory
set :deploy_to, "/home/ehamamrah/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 2

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# set :passenger_roles, :app
# set :passenger_restart_runner, :sequence
# set :passenger_restart_wait, 5
# set :passenger_restart_limit, 2
# set :passenger_restart_with_sudo, false
# set :passenger_environment_variables, {}
# set :passenger_restart_command, 'passenger-config restart-app'
# set :passenger_restart_options, -> { "#{deploy_to} --ignore-app-not-running" }
# # set :passenger_in_gemfile, true

require 'capistrano/local_precompile'

# config valid for current version and patch releases of Capistrano
lock "~> 3.14.0"

set :user, 'Evehx'
set :repo_url, 'https://Evehx@bitbucket.org/igornichele/oncrets_web.git'
set :git_http_username, 'Evehx'
set :git_http_password, 'kukkud-voffa7-tuvcAn'
set :branch, 'master'

set :deploy_to, '/var/www/evehx_elongations'

set :rvm_ruby_version, '2.6.3'

set :ssh_options,
    forward_agent: true,
    auth_methods: ['publickey'],
    keys: ['/.ssh/evehx_elongations.pem']
set :format, :airbrussh

set :log_level, :debug
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :keep_releases, 5

# after 'deploy:update_crontab', 'deploy:start_again'
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    on roles(:all) do
      within current_path do
        execute 'sleep 4'
      end
    end
    invoke 'unicorn:start'
    # invoke! 'unicorn:start'
  end
end

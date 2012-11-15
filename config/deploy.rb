require 'capistrano_colors'
require "bundler/capistrano"

set :application, "captest"
set :repository,  "git@github.com:ogawakeisuke/captest.git"
set :deploy_to, "/home/deploy/#{application}"
set :rails_env, "development"

#ここらの情報はRAILS_ENVに応じて変わってくることが多いので本来はdeploy/に個別に設定する

set :scm, :git
set :branch, "master"
set :scm_verbose, true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :user, 'ogawa'
set :user_sudo, true


set :bundle_gemfile, "Gemfile" #バンドル系
set :bundle_cmd, "bundle"
set :bundle_roles, [:app]

set :git_shallow_clone, 1

role :web, "ec2-54-242-182-42.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-54-242-182-42.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-54-242-182-42.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run

set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"


#unicornスタート設定　完コピ
namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
#  task :symlink_static do
#    print "    creating symlink /var/www/#{application}/ -> #{current_path}/public.\n"
#    run "ln -s #{current_path}/public /var/www/#{application}"
#  end
end



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
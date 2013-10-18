require 'bundler/capistrano'
load 'deploy/assets'

ssh_options[:forward_agent] = true
set :user, "root"
set :password, "mWmWN2C1"
server "37.200.65.209", :app, :web, :db, :primary => true

set :application, "easy-stock-center"
set :deploy_to, "/home/www/#{application}"

default_run_options[:pty] = true 
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :repository, "https://github.com/rokkit/easy_stock_center.git"
set :branch, "master"
set :deploy_via, :remote_cache


# if you want to clean up old releases on each deploy uncomment this:
 after "deploy:restart", "deploy:cleanup"
  
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
set :bundle_flags, "--quiet --binstubs --shebang ruby-local-exec"
set :default_environment, {
  'RBENV_ROOT' => "$HOME/.rbenv/",
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
desc "Fix permission"
task :fix_permissions, :roles => [ :app, :db, :web ] do
  run "#{try_sudo} chmod 777 -R #{current_path}/log"
  run "#{try_sudo} chmod 777 -R #{current_path}/tmp"
  run "#{try_sudo} chmod 777 -R #{current_path}/public"
end

after "deploy:update_code", :fix_permissions
after :deploy do
  run "#{try_sudo} chmod 777 -R #{current_path}/log"
  run "#{try_sudo} chmod 777 -R #{current_path}/tmp"
  run "#{try_sudo} chmod 777 -R #{current_path}/public"
end
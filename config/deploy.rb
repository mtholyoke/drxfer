require "bundler/capistrano"

set :application, "drxfer"
set :repository,  "https://github.com/svenaas/drxfer"
set :scm, :git
ssh_options[:forward_agent] = true
set :branch, 'master'
set :deploy_via, :remote_cache
set :deploy_to, "/local/data/web/passenger/#{application}"
set :use_sudo, false

role :web, "drxfer.mtholyoke.edu"
role :app, "drxfer.mtholyoke.edu"
role :db,  "drxfer.mtholyoke.edu", :primary => true 

set :user, 'saas'

# Assuming Passenger mod_rails:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Copy production database config from ~/deployment_configs
desc "Copy production configuration files"
task :copy_production_configs, :except => { :no_release => true }, :role => :app do  
  run "cp -f ~/deployment_configs/drxfer_database.yml #{release_path}/config/database.yml"  
  run "cp -f ~/deployment_configs/drxfer_ldap.yml #{release_path}/config/ldap.yml"  
  run "cp -f ~/deployment_configs/drxfer_production.rb #{release_path}/config/environments/production.rb"  
  run "cp -f ~/deployment_configs/drxfer_notifications.rb #{release_path}/config/initializers/notifications.rb"  
  run "cp -f ~/deployment_configs/drxfer_local.css #{release_path}/app/assets/stylesheets/local.css"  
end  

# Use symlink to a permanent folder in {shared_path} to contain uploaded files
desc "Update shared uploads folder"
task :update_shared_uploads_folder do
  run "rm -rf #{release_path}/public/uploads"
  run "mkdir -p #{shared_path}/system/uploads"
  run "ln -nfs #{shared_path}/system/uploads #{release_path}/public/uploads"
end

# Use symlink to a folder or symlink in {shared_path} to contain transferred files
desc "Update transfers folder"
task :update_transfers_folder do
  run "rm -rf #{release_path}/transfers"
  run "mkdir -p #{shared_path}/system/transfers"
  run "ln -nfs #{shared_path}/system/transfers #{release_path}/transfers"
end

after "deploy:finalize_update", :copy_production_configs, 
                                :update_shared_uploads_folder, 
                                :update_transfers_folder

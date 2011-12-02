set :application, "drxfer"
set :repository,  "https://github.com/svenaas/drxfer"
set :scm, :git
ssh_options[:forward_agent] = true
set :branch, 'master'
set :deploy_via, :remote_cache
set :deploy_to, "/local/data/web/passenger/#{application}"

role :web, "drxfer"
role :app, "drxfer"
role :db,  "db001", :primary => true 

# Assuming Passenger mod_rails:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Copy production database config from ~/
namespace :db do  
  task :db_config, :except => { :no_release => true }, :role => :app do  
    run "cp -f ~/database.yml #{release_path}/config/database.yml"  
  end  
end  

# Use symlink to a permanent folder in {shared_path} to contain uploaded files
desc "Update shared uploads folder"
task :update_shared_uploads_folder do
  run "rm -rf #{release_path}/public/uploads"
  run "mkdir -p #{shared_path}/system/uploads"
  run "ln -nfs #{shared_path}/system/uploads #{release_path}/public/uploads"
end

after "deploy:finalize_update", "db:db_config", :update_shared_uploads_folder

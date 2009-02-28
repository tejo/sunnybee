set :ssh_options, { :forward_agent => true }


default_run_options[:pty] = true
# repository e destinazione di deploy sono sullo stesso server
set :local_repository,  "ssh://admin@151.1.234.10/home/admin/git/sunnybee.git"
set :repository, "file:////home/admin/git/sunnybee.git"


set :scm, "git" 
set :branch, "master" 
set :deploy_via, :remote_cache

# ssh://xyzreply@awaredesign.eu
set :application, "sunnybee.caringbee.com"
set :deploy_to, "/srv/www/aware/#{application}" 
set :user, "admin" 
set :use_sudo, false 



role :app, "151.1.234.10" 
role :web, "151.1.234.10" 
role :db,  "151.1.234.10", :primary => true

namespace :deploy do
  desc "Restart Application" 
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt" 
  end
  desc "Start Application -- not needed for Passenger" 
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end  
end



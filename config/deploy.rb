# -*- encoding : utf-8 -*-

set :application, "czarna_13"
set :repository,  "git@github.com:Vangerdahast/czarna_13.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


#set :gateway, "verbum-rails.megiteam.pl"
set :user, "verbum-rails"
set :use_sudo, false
set :deploy_to, "/home/verbum-rails/www/#{application}"
set :deploy_via, :remote_cache

role :web, "verbum-rails.megiteam.pl"                          # Your HTTP server, Apache/etc
role :app, "verbum-rails.megiteam.pl"                         # This may be the same as your `Web` server
role :db,  "verbum-rails.megiteam.pl", :primary => true # This is where Rails migrations will run


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"
after "deploy:update_code", "customs:symlink"

namespace :deploy do
  task :bundle_gems do 
   run "cd #{deploy_to}/current && bundle install "  
  end
  task :start do ; end
  task :stop do ; end
  #task :restart, :roles => :app, :except => { :no_release => true } do
  #  run "touch #{File.join(current_path,'tmp','restart.txt')}"
  #end
  
  task :restart, :roles => :app do
    run "restart-app #{ application }"
  end  
end

namespace :customs do  
  task :symlink, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/system/uploads/ #{release_path}/public/uploads/
    CMD
  end
end
    

#after "deploy", "deploy:bundle_gems"
#after "deploy:bundle_gems", "deploy:restart"
# -*- encoding : utf-8 -*-

require "bundler/capistrano"


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

namespace :deploy do
  task :bundle_gems do 
   run "cd #{deploy_to}/current && bundle install"  
end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#after "deploy", "deploy:bundle_gems"
#after "deploy:bundle_gems", "deploy:restart"

#namespace :deploy do
#  desc "Restart aplikacji przy pomocy skryptu Megiteam"
#  task :restart, :role => :app do
#    run "restart-app #{ application }"
#  end
#end
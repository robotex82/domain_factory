require 'yaml'

domain_factory = YAML::load(File.open(File.dirname(File.expand_path(__FILE__)) + '/../domain_factory.yml'))

set :branch, $1 if `git branch` =~ /\* (\S+)\s/m

set :rails_env, "staging"

role :web, domain_factory['ssh']['deploy_host'] # Your HTTP server, Apache/etc
role :app, domain_factory['ssh']['deploy_host'] # This may be the same as your `Web` server
role :db,  domain_factory['ssh']['deploy_host'], :primary => true # This is where Rails migrations will run

set :user,     domain_factory['ssh']['username'] # DomainFactory SSH User: ssh-xxxxxx-???
set :password, domain_factory['ssh']['password'] # DomainFactory SSH Password
set :use_sudo, false        # Don't use sudo

# Deployment path on DomainFactory:
# /kunden/xxxxxx_xxxxx/foo_app
set :deploy_to, "/kunden/#{domain_factory['customer_number']}/#{domain_factory['app']['name']}/staging"



# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  
  desc "Restart the server"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{current_path}/tmp/restart.txt"
  end
end

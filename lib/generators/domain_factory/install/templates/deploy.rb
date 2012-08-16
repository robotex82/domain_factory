require 'yaml'

domain_factory = YAML::load(File.open(File.dirname(File.expand_path(__FILE__)) + '/domain_factory.yml'))

set :stages, domain_factory['capistrano']['stages']
set :default_stage, domain_factory['capistrano']['default_stage']
require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'ecm_capistrano_yaml_db'
#require 'ecm/capistrano/backup2s3'



set :application, domain_factory['app']['name']

set :scm, :git
set :repository, domain_factory['git']['repository']
set :deploy_via, :remote_cache

default_run_options[:pty]   = true  # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true  # Use local ssh keys

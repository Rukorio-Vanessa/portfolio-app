require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :start do
    exec "rerun -b 'rackup config.ru'"
end

desc "Runs a Pry console"
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

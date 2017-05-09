require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "A console"
task :console do
  Pry.start
end

desc "Generate industries models"
task :industries do
    INDUSTRIES.each{|industry| Industry.create(name: industry)} 
end
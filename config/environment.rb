require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite'
  )

require_all 'app'

# $: << File.expand_path('../', __FILE__)
# Dir['./app/**/*.rb'].sort.each{|file| require file}

INDUSTRIES = ["Hospitality", "Technology", "Medicine", "Arts", "Government", "Education", "Non-profit", "Finance"]
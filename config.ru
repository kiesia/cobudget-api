$LOAD_PATH << '.'
#config.ru
require 'rubygems'
require 'sinatra'
require 'rack'
require 'rack/cors'
use Rack::Cors do |config|
  config.allow do |allow|
    allow.origins '*'
    allow.resource '*',
        :methods => [:get, :post, :put, :delete, :options],
        :headers => :any,
        :max_age => 0
  end
end

require 'cobudget_sinatra'
set :root, Pathname(__FILE__).dirname
set :environment, ENV['RACK_ENV']
set :run, false
run CobudgetWeb

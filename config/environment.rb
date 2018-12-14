require 'bundler'
Bundler.require

configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'development', pool: 2, username: 'christopherbeltran', password: 'Lakeshow24'}
end

require_all 'app'

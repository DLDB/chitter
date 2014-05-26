require 'sinatra'
require 'data_mapper'
require_relative 'helpers/chitter'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'rnPfcJXohZ7boWrbaZH+2V6XvUkVNf'

get '/' do
  erb :welcome
end

post '/signup' do
  name = params["name"]
  email = params["email"]
  user_name = params["user_name"]
  password = params["password"]
  password_confirmation = params["password_confirmation"]
  user = User.create(name: name, 
    email: email, 
    user_name: user_name, 
    password: password,
    password_confirmation: password_confirmation)
  session[:user_id] = user.id
  redirect to('/')
end




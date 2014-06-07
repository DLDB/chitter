require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'
require 'rack-flash'
require_relative 'helpers/chitter'
require_relative 'controllers/welcome'
require_relative 'controllers/signup'
require_relative 'controllers/cheets'
require_relative 'controllers/signin'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

set :partial_template_engine, :erb

use Rack::Flash

require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'rnPfcJXohZ7boWrbaZH+2V6XvUkVNf'





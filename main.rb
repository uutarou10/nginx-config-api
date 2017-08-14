require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'This is Nginx config generate api.'
end

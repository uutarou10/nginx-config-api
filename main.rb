require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'

get '/' do
  'This is Nginx config generate api.'
end

post '/route/*' do |sub_domain|
  if sub_domain.empty? || sub_domain.include?('.') then
    status 400
    json :isSuccess => false, :message => 'Invaild domain.'
  else
    return sub_domain
  end
end

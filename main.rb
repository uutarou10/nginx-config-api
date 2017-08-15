require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'yaml'
require 'pathname'
require 'erb'
require 'logger'

CONFIG = YAML.load_file('./config.yml')
ENV = development? ? 'develop' : 'production'

configure do
  mime_type :text, 'text/plain'
end

get '/' do
  'This is Nginx config generate api.'
end

post '/route/*' do |sub_domain|
  if sub_domain.empty? || sub_domain.include?('.') then
    status 400
    json :isSuccess => false, :message => 'Invaild domain.'
  else
    # json :isSuccess => true, :message => 'Successful request!'
    content_type :text
    write_config_file(sub_domain)
  end
end

# ----------
# functions
# ----------
def write_config_file(sub_domain)
  path = Pathname.new(CONFIG[ENV]['nginx']['conf_dir'])
  path += sub_domain + '.conf'

  internal_address = CONFIG[ENV]['domain']['base'] 

  erb = ERB.new(File.read('./config_template.erb'))

  erb.result(binding)
end

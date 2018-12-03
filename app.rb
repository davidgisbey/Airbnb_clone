require 'sinatra/base'

class Airbnb < Sinatra::Base
  get '/' do
    'Hello Battle!'
  end

  get '/spaces' do
    erb(:spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

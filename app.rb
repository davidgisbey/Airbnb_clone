require 'sinatra/base'

class Airbnb < Sinatra::Base
  get '/' do
    erb :login, {:layout => true}
  end

  get '/space/add' do
    erb :add, {:layout => true}
  end

  post '/spaces/new' do

  end

  get '/spaces' do
    erb :spaces
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require './lib/database_connection.rb'
require './lib/user.rb'

class Airbnb < Sinatra::Base

  Database_connection.connect

  get '/' do
    'Hello Battle!'
  end

  get '/register' do
    erb(:register)
  end

  post '/register' do
    p params
    if User.email_already_exists?(params[:Email]) == true
      redirect('/register') # Sinatra flash will have to be added later
    end
    User.create(params[:Email], params[:Username], params[:Password])
    redirect('/spaces')
  end

  get '/space/add' do
    erb(:add)
  end

  post '/spaces/new' do

  end

  get '/spaces' do
    erb(:spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

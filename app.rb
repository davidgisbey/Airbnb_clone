require 'sinatra/base'
require './lib/database_connection.rb'
require './lib/user.rb'
require './lib/space.rb'

class Airbnb < Sinatra::Base
  enable :sessions

  Database_connection.connect

  get '/' do
    erb(:login, {:layout => true})
  end

  post '/login' do
    if User.authenticate(params[:email], params[:password]) == false
      redirect('/')
    end
    session[:user] = User.authenticate(params[:email], params[:password])
    redirect('/spaces') #Redirects
  end

  get '/register' do
    erb(:register, {:layout => true})
  end

  post '/register' do
    if User.email_already_exists?(params[:email]) == true
      redirect('/register') # Sinatra flash will have to be added later
    end
    session[:user] = User.create(params[:email], params[:username], params[:name], params[:password])
    redirect('/spaces')
  end

  get '/space/add' do
    erb(:add, {:layout => true})
  end

  post '/spaces/new' do
    p params
<<<<<<< HEAD
=======
    p @user_id = session[:user].id
    Space.create(@user_id, params[:space_name], params[:price_per_night], params[:property_description])
>>>>>>> 864775255012dcbc808dcb7edd1e858677078ec6
    redirect('/spaces')
  end

  get '/spaces' do
    @user = session[:user] # Contains user object which has username, id, email
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

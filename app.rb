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
    @email_taken = session[:register_message]
    erb(:register, {:layout => true})
  end

  post '/register' do
    if User.email_already_exists?(params[:email]) == true
      session[:register_message] = "Sorry, but that email address is already taken"
      redirect('/register')
    end
    session[:user] = User.create(params[:email], params[:username], params[:name], params[:password])
    redirect('/spaces')
  end

  get '/space/add' do
    redirect('/login') unless session[:user]
    erb(:add, {:layout => true})
  end

  post '/spaces/new' do
    p @user_id = session[:user].id
    Space.create(@user_id, params[:space_name], params[:price_per_night], params[:property_description])
    redirect('/spaces')
  end

  get '/spaces' do
    redirect('/login') unless session[:user]
    @user = session[:user] # Contains user object which has username, id, email
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

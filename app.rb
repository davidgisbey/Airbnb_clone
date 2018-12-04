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

  get '/login' do
    erb(:login)
  end

  post '/login' do
    p params
    if User.authenticate(params[:email], params[:password]) == false
      redirect('/login')
    end
    session[:user] = User.authenticate(params[:email], params[:password])
    redirect('/spaces') #Redirects 
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
    erb :add, {:layout => true}
  end

  post '/spaces/new' do

  end

  get '/spaces' do
    @user = session[:user] # Contains user object which has username, id, email
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

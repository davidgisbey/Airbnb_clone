require 'sinatra/base'
require './lib/database_connection.rb'
require './lib/user.rb'
require './lib/space.rb'
require './lib/availability.rb'
require 'json'

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
    redirect('/spaces')
  end

  get '/spaces' do
    @user = session[:user] # Contains user object which has username, id, email
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  get '/spaces/book/:id' do
    p params
    @space_id = params[:space_id]
    p @start_adate = "12/12/2018" # Start available date from db
    p @end_adate = "01/01/2019" # End available date from db
    p @booked_dates = "13/12/2018.14/12/2018" # Booked dates from db
    erb(:book, {:layout => true})
    # This will search by space id for booked dates params
  end

  post '/spaces/book/:id' do
    p params
    redirect('/spaces')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require './lib/database_connection.rb'
require './lib/user.rb'
require './lib/space.rb'
require './lib/availability.rb'
require './lib/bookings.rb'
require './lib/calendar_prep.rb'

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

  get '/spaces' do
    @spaces = Space.list
    erb(:spaces, {:layout => true})
  end

  get '/space/add' do

    erb(:add, {:layout => true})
  end

  post '/spaces/new' do
    @user = session[:user]
    p params
    p @space = Space.create(@user.id, params[:name], params[:price], params[:property_description])
    Availability.update(@space.id, params[:start], params[:end])
    redirect('/spaces')
  end

  get '/spaces/book/:id' do
    p @space_id = params[:id]
    availability_space = Availability.retrieve(@space_id)
    bookings = Bookings.bookings_for_space_id(@space_id)
    @start_adate = availability_space.min_date
    @end_adate = availability_space.max_date
    @booked_dates = Calendar_prep.unavailable_dates(availability_space, bookings)
    erb(:book, {:layout => true})
    # This will search by space id for booked dates params
  end

  post '/spaces/book/:id' do
    @user = session[:user]
    p params
    redirect('/spaces')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'

class Makersbnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/sessions/new' do
    erb(:log_in)
  end

  post '/sessions' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user] = user
      redirect '/spaces'
    else
       flash[:notice] = 'Please check your email or password.'
       redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user' do
    if User.password_same?(password: params['password'], confirm_password: params['confirm_password'])
      session[:user] = User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'])
      redirect '/spaces'
    else
       flash[:notice] = 'Please ensure your passwords match.'
       redirect('/user/new')
    end
  end

  get '/spaces' do
    @user = session[:user]
    erb(:list_spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end

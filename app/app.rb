ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super_secret'

  get '/peeps/new' do
    @peeps = Peep.all
    erb :new
  end

  post '/peeps' do
    peep = Peep.create(peep: params[:peep], created_at: params[:created_at])
    peep.save
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if user.save
    session[:user_id] = user.id
    redirect to('/peeps/new')
    else
    flash.now[:notice] = "Passwords don't match"
    erb :'/users/new'
    end
  end

    get '/sessions/new' do
      erb ':sessions/new'
    end

    post '/sessions' do
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user_id
        redirect to ('/peeps/new')
      else
        flash.now[:errors] = "Passwords don't match"
        erb :'/sessions/new'
      end
    end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end
end

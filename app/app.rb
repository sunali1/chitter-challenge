ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
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
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    p user
    user.save
    p user
    redirect to('/peeps/new')
  end
    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end
end

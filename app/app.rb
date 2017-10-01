ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

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
                      password: params[:password])
    p user
    user.save
    p user
    redirect to('/peeps/new')
  end
end

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

end

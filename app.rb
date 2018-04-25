require_relative 'config/environment'



class App < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @session = session

    erb :index
  end

  post '/checkout' do
    session[params.keys.flatten] = params[:item]
    @session = session
    binding.pry
    erb :checkout
  end

end

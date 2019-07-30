require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    #binding.pry
    @user = User.find_by_username(params["username"])
    binding.pry
    if @user
      session[:id] = @user.id
      #binding.pry
      redirect to '/account'
    else
      erb :error
    end

  end

  get '/account' do
    @user = User.find_by_id(session[:id])
    #binding.pry
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

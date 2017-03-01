class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ""
    set :views, "app/views"
  end

  get '/' do
    erb :index
  end

  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect("/")
    end
  end

  get '/signup' do
    if !logged_in?
      erb :"/users/signup"
    else
      redirect("/")
    end
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end
end
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

  post '/login' do
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect("/users/#{user.id}")
    else
      redirect("/signup")
    end
  end

  get '/signup' do
    if !logged_in?
      erb :"/users/signup"
    else
      redirect("/")
    end
  end

  post '/signup' do
    if params[:user][:email] == "" || params[:user][:password] == "" || params[:user][:name] == ""
      redirect("/signup")
    
    else
      @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])

      params[:jobs].delete_if{|job_hash| job_hash.value?("")}

      params[:jobs].each do |job_hash|
        @user.jobs << Job.create(name: job_hash[:name], salary: job_hash[:salary], industry_id: job_hash[:industry_id])
      end
      
      account = Account.create(params[:account])
      @user.accounts << account
      
      @user.save
      session[:user_id] = @user.id
      redirect("/users/#{@user.id}")
    end
  end
  
  # post '/users/:id' do
  #   @user = User.find_by(params[:id])
  #   @user.update(params)
  #   erb :'/show_user'
  # end
  
  get '/logout' do
    session.clear
    redirect("/")
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
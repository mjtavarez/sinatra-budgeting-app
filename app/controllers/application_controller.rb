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
    @user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
    
    params[:jobs].delete_if{|job_hash| job_hash.value?("")}

    params[:jobs].each do |job_hash|
      job = Job.find_or_create_by(name: job_hash[:name].downcase)
      
      @user.jobs << job
      UserJob.last.job.update(salary: job_hash[:salary], industry_id: job_hash[:industry_id])
    end
    
    if !params[:account].value?("")
      account = Account.create(params[:account])
      @user.accounts << account
    end
    
    if @user.save
      session[:user_id] = @user.id
      redirect to("/users/#{@user.id}")
    else
      erb :"/users/signup"
    end
  end
  
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
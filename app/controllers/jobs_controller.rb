class JobsController < ApplicationController
    
    get '/jobs' do
        erb :'/jobs/index'
    end
    
    get '/jobs/new' do
        # do I need to check that current_user is owner?
        # how do I ensure that users only add jobs to their own profiles
        
        # TEST: login as one user and see if you can add new job on different user's profile
        
        if logged_in?
            erb :'/jobs/create_job'
        else
            redirect to("/")
        end
    end
    
    get '/jobs/:id' do
        @user_job = UserJob.find(params[:id])
        
        if current_user == @user_job.user
            erb :'/jobs/show_job'
        elsif logged_in?
            redirect to("/users/#{session[:user_id]}")
        else
            redirect to("/")
        end
    end
    
    get '/jobs/:id/edit' do
        @user_job = UserJob.find(params[:id])
        
        if current_user == @user_job.user
            erb :'/jobs/edit_job' 
        elsif logged_in?
            redirect to("/users/#{session[:user_id]}")
        else
            redirect to("/")
        end
    end
    
    # post '/jobs/:id' do
        
    # end
    
    patch '/jobs/:id' do
        @user_job = UserJob.find(params[:id])
        
        if params[:user_job][:name] != ""
            @user_job.job.update(name: params[:user_job][:name], salary: params[:user_job][:salary], industry_id: params[:user_job][:industry_id])
            @user_job.save
            redirect to("/users/#{@user_job.user_id}")
        else
            redirect to("/jobs/#{@user_job.id}/edit")
        end
    end
    
    post '/jobs/:id/delete' do
        # user_jobs = UserJob.where(params[:]).destroy_all
        # raise user_jobs.inspect
        # raise params.inspect
        # @user = User.find(user_jobs.user_id)
        # redirect("/users/#{@user.id}")
    end
end
class JobsController < ApplicationController
    
    get '/jobs' do
        if logged_in?
            erb :'/jobs/index'
        else
            redirect to("/")
        end
    end
    
    get '/jobs/new' do
        if logged_in?
            erb :'/jobs/new'
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
            redirect to("/users/#{current_user.id}")
        else
            redirect to("/")
        end
    end
    
    post '/jobs' do
        job_name = params[:job][:name]
        
        if job_name != "" && params[:job][:salary] != ""
            user_job = Job.find_or_create_by(name: job_name)
            user_job.update(salary: params[:job][:salary], industry_id: params[:job][:industry_id])
            current_user.jobs << user_job
            redirect to("/users/#{current_user.id}")
        else
            redirect to("/jobs/new")
        end
    end
    
    patch '/jobs/:id' do
        @user_job = UserJob.find(params[:id])
        
        if params[:user_job][:name] != "" && params[:user_job][:salary] != ""
            @user_job.job.update(name: params[:user_job][:name], salary: params[:user_job][:salary], industry_id: params[:user_job][:industry_id])
            @user_job.save
            redirect to("/jobs/#{@user_job.id}")
        else
            redirect to("/jobs/#{@user_job.id}/edit")
        end
    end
    
    post '/jobs/:id/delete' do
        user_job = UserJob.find(params[:id]).destroy
        redirect("/users/#{user_job.user_id}")
    end
end
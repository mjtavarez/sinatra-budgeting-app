class UsersController < ApplicationController
    
    get '/users/:id' do
        if logged_in?
            @user = User.find(params[:id]) 
            erb :'/users/show_user'
        else
            redirect("/")
        end
    end
    
    get '/users/:id/update' do
        if logged_in? && current_user == params[:id]
            @user = User.find(params[:id])
            erb :'/users/edit_user'
        elsif logged_in?
            @user = current_user
            erb :'/users/show_user'
        else
            erb :'/users/login'
        end
    end
    
    patch '/users/:id' do
        @user = User.find(params[:id])

        params[:user][:jobs].delete_if{|job_hash|job_hash.has_value?("")}
        
        params[:user][:jobs].each do |job_hash|
            @user.jobs.where(id: job_hash[:id]).update(job_hash)
        end
        
        new_jobs = params[:user][:jobs].select{|job_hash| !job_hash.key?(:id)}
        new_jobs.each{|new_job_hash| @user.jobs << Job.new(name: new_job_hash[:name], salary: new_job_hash[:salary], industry_id: new_job_hash[:industry_id])}
        
        
        params[:user][:accounts].delete_if{|account_hash|account_hash.has_value?("")}
        
        params[:user][:accounts].each do |account_hash|
            @user.accounts.where(id: account_hash[:id]).update(account_hash)
        end
        
        new_accounts = params[:user][:accounts].select{|account_hash| !account_hash.key?(:id)}
        new_accounts.each{|new_account_hash| @user.accounts << Account.new(name: new_account_hash[:name], balance: new_account_hash[:balance], interest: new_account_hash[:interest], due_date: new_account_hash[:due_date])}
        
        redirect("/users/#{@user.id}")
    end
    
    helpers do
        def owner?
            self.user_id == current_user.id
        end
    end
end
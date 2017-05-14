class AccountsController < ApplicationController
    
    get '/accounts' do
        erb :"/accounts/index" 
    end
        
    post '/accounts' do
        @account = Account.new(name: params[:name], due_date: params[:due_date], interest: params[:interest], balance: params[:balance])
        if @account.save
            current_user.accounts << @account
            redirect to("accounts/#{@account.id}")
        else
            redirect to("/accounts/new")
        end
    end
    
    get '/accounts/new' do
        erb :"/accounts/new"
    end
    
    get '/accounts/:id' do
        @account = Account.find(params[:id])
        if current_user == @account.user
           erb :"/accounts/show_account" 
        elsif logged_in?
            redirect to("/users/#{current_user.id}")
        else
            redirect to("/")
        end
    end
    
    get '/accounts/:id/edit' do
        
        @account = Account.find(params[:id])
        if current_user == @account.user
            erb :"/accounts/edit_account"
        elsif logged_in?
            redirect to("/users/#{current_user.id}")
        else
            redirect to("/")
        end
    end
    
    patch '/accounts/:id' do
        @account = Account.find(params[:id])
        
        if params[:name] != "" && params[:balance] != "" && params[:due_date] != "" && params[:interest] != ""
            @account.update(name: params[:name], balance: params[:balance],  due_date: params[:due_date], interest: params[:interest])
            redirect to("/accounts/#{@account.id}")
        else
            redirect to("/accounts/#{@account.id}")
        end
    end
    
    post '/accounts/:id/delete' do
        @account = Account.find(params[:id])
        if current_user == @account.user
            @account.destroy
            redirect to("/users/#{@account.user.id}")
        elsif logged_in?
            redirect to("/users/#{current_user.id}")
        else
            redirect to("/")
        end
    end
end
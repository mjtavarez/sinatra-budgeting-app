class AccountsController < ApplicationController
    
    get '/accounts/:id' do
        @account = Account.find(params[:id])
        if session[:user_id] == @account.user_id
           erb :"/accounts/show_account" 
        else
            redirect("/")
        end
    end
    
    get '/accounts/:id/edit' do
        
    end
    
    patch '/accounts/:id' do
         
    end
    
    post '/accounts/:id/delete' do
        @account = Account.find(params[:id])
        if session[:user_id] == @account.user_id
            @account.destroy
            redirect("/users/#{@user.id}")
        else
            redirect to("/")
        end
    end
end
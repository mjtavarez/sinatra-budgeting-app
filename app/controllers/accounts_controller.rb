class AccountsController < ApplicationController
    post '/accounts/:id/delete' do
        account = Account.find(params[:id]).destroy 
        @user = User.find(account.user_id)
        redirect("/users/#{@user.id}")
    end
end
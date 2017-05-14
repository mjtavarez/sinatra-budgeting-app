class UserJobsController < ApplicationController
    
    get '/user_jobs' do
        if logged_in?
            @user = current_user
            erb :'/user_jobs/index.erb'
        else
            erb :'/login'
        end
    end
end
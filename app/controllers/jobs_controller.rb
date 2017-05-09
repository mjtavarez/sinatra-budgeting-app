class JobsController < ApplicationController
    
    post '/jobs/:id/delete' do
        # user_jobs = UserJob.where(params[:]).destroy_all
        # raise user_jobs.inspect
        raise params.inspect
        # @user = User.find(user_jobs.user_id)
        # redirect("/users/#{@user.id}")
    end
end
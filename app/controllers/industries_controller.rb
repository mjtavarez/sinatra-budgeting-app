class IndustriesController < ApplicationController
    
    get '/industries' do
        erb :"/industries/index"
    end
    
    get '/industries/:id' do
        @industry = Industry.find(params[:id])
       erb :"/industries/show_industry"
    end

end
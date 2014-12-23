class WeightsController < ApplicationController

    def weight_params
    	params.require(:weight).permit(:content, :user_id) 
    end	   


    def create
   	@weight = Weight.new
   	@weight.user_id = current_user.id
    
   	if @weight.save
        	redirect_to current_user
        else
        	flash[:error] = "Problem!"
        	redirect_to current_user
     	end
    end


end

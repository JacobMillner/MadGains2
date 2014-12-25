class WeightsController < ApplicationController



    def create
   	@weight = Weight.new(weight_params)
   	@weight.user_id = current_user.id
    
   	if @weight.save
        	redirect_to current_user
        else
        	flash[:error] = "Problem!"
        	redirect_to current_user
     	end
    end

    def weight_params
    	params.require(:weight).permit(:content, :user_id) 
    end	   

end

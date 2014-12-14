class UsersController < ApplicationController

	def new
		@user = User.new
	end

	
	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user, notice: "Thank you for signing up for MadGains!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
	end

	def user_params
      		params.require(:user).permit(:avatar_url, :username, :name, :email, :password, :password_confirmation) 
    	end

end

class UsersController < ApplicationController

	def new
		if current_user
			redirect_to buddies_path
		else
			@user = User.new
		end	
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


	def edit	
		if current_user
			@user = current_user
			@weight = Weight.new
			#@weights = Weight.where(user_id: current_user.id)
		else
			redirect_to root_url
		end
	end		

	def show
		@user = User.find(params[:id])
		@post = Post.new

		@relationship = Relationship.where(
    			follower_id: current_user.id,
    			followed_id: @user.id
		).first_or_initialize if current_user
	end
	
	def index
		@users = User.all
	end

	def buddies
		if current_user
			@post = Post.new
			buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
			@posts = Post.where(user_id: buddies_ids)
		else
			redirect_to root_url
		end
	end

	def user_params
      		params.require(:user).permit(:avatar_url, :username, :name, :email, :password, :password_confirmation) 
    	end

end

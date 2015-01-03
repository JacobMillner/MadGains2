class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by_username(params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
        flash[:success] = "Logged in!"
		redirect_to user
	else
		flash[:warning] = "Wrong Username or Password"
		redirect_to root_url
	end
  end

  def destroy
	reset_session
    flash[:success] = "Logged out."
	redirect_to root_url
  end
end

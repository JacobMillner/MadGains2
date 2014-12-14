class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by_username(params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to user, notice: "Logged in!"
	else
		flash[:error] = "Wrong Username or Password"
		redirect_to root_url
	end
  end

  def destroy
	#session[:userid] = nil
	reset_session
	redirect_to root_url, notice: "Logged out."
  end
end

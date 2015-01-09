require 'will_paginate/array' 
class PostsController < ApplicationController
    def post_params
    	params.require(:post).permit(:content, :user_id) 
    end	   

    def index
    	@posts = Post.all.includes(:user)
        @posts = @posts.paginate(:page => params[:page], :per_page => 6)#.order('created_at DESC')
	    @post = Post.new
    end

    def create
   	@post = Post.new(post_params)
   	@post.user_id = current_user.id
    
   	if @post.save
        	redirect_to current_user
        else
        	flash[:danger] = "Problem!"
        	redirect_to current_user
     	end
    end

end

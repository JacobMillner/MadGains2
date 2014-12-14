class PostsController < ApplicationController

    def post_params
    	params.require(:post).permit(:content, :userid)
    end	   

    def index
    	@posts = Post.all.includes(:user)
	@post = Post.new
    end

    def create
   	@post = Post.new(params[post_params])
   	@post.user_id = current_user.id
    
   	if @post.save
        	redirect_to current_user
        else
        	flash[:error] = "Problem!"
        	redirect_to current_user
     	end
    end

end

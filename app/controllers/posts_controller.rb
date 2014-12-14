class PostsController < ApplicationController

    def post_params
    	params.require(:post).permit(:content, :userid)
    end	   

    def create
   	@post = Post.new(params[:post])
   	@post.userid = current_user.id</p>
    
   	if @post.save
        	redirect_to current_user
        else
        	flash[:error] = "Problem!"
        	redirect_to current_user
     	end
    end

end

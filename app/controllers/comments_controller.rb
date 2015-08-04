class CommentsController < ApplicationController
  before_action :set_post_for_comment, only: [:create, :destroy]
 

def create
  @comment = @post.comments.build(comment_params)
  @comment.user_id = current_user.id
  
  if @comment.save
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  else
    flash.now[:alert] = " check the comment form, something went wrong."
    render root_path
  end
    
end  
  
def destroy
  @comment = @post.comments.find(params[:id])
  if @comment.user == current_user
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end
  
end
  
end

private

def comment_params
  params.require(:comment).permit(:content)
end

def set_post_for_comment
  
    @post = Post.find(params[:post_id])
 
end



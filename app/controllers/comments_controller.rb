class CommentsController < ApplicationController
  before_action :set_post_for_comment, only: [:create, :destroy]
 

def create
  @comment = @post.comments.build(comment_params)
  @comment.user_id = current_user.id
  
  if @comment.save
    flash[:success] = "You have created a new comment"
    redirect_to :back
  else
    flash.now[:alert] = " check the comment form, something went wrong."
    render root_path
  end
    
end  
  
def destroy
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  flash[:success] = "comment destroyed!"
  redirect_to root_path
  
end
  
end

private

def comment_params
  params.require(:comment).permit(:content)
end

def set_post_for_comment
  
    @post = Post.find(params[:post_id])
 
end



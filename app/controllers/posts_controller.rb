class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!
  before_action :check_owner, only: [:edit, :update, :destroy ]
  def index
    @posts = Post.all.order('created_at ASC').page params[:page]
  end


  def new
    @post = current_user.posts.build
  
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has successfully been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end
  
  def destroy
   
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to(posts_path)
  end
  
  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    end
    
  end
  
    def unlike
      if @post.unliked_by current_user
        respond_to do |format|
          format.html {redirect_to :back}
          format.js
        end
      end
    
  end

end

  private
  
  def post_params
    params.require(:post).permit(:image, :caption)
    
  end
  
  def set_post
    
       @post = Post.find(params[:id])
  end
  
  def check_owner
    unless @post.user == current_user
      flash[:error] = "That post does not belong to you!"
      redirect_to(root_path)
    end
  end
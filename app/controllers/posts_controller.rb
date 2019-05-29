class PostsController < ApplicationController
	
	 before_action :authenticate_user!
     before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
  	@post = Post.all
  end	
  def show
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
 	
end


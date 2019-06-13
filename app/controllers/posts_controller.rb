class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @comments = @post.comments
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    #if @post.update(edit_params)
    #  redirect_to @post, notice: 'Post was successfully updated.'
    #else
    #  render :edit
    #end
  end

  def update
    #@post.update(post_params)
    #redirect_to @post
    if @post.update(edit_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
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


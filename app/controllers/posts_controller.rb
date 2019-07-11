class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
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
    authorize @post
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end
  
end


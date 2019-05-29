class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
      @like = current_user.likes.build(post: @post)
      if @like.save
	      respond_to do |format|
	        format.html { redirect_to posts_path }
	        format.js
	      end
      else
      	flash[:error] = 'Could not like the post'
      end
  end

  def destroy
      @like.destroy
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
   @like = @post.likes.find(params[:id])
  end
end

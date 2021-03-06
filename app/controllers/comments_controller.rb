class CommentsController < ApplicationController
  before_action :find_post, only: [:create]
  # before_action :find_comment, only: [:destroy]

  def create
    
    @comment = current_user.comments.build(comment_params)
    if @comment.save!
      respond_to do |format|
          format.html { redirect_to posts_path }
          format.js
        end
  	else
  	  flash[:error] = "Comment was not created"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: 'Comment was successfully deleted.')
  end

  private

  def find_post
    @post = Post.find(comment_params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end

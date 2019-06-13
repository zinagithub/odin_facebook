class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment was successfully created."
  	else
  	  flash[:error] = "Comment was not created"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: 'Comment was successfully deleted.')
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end

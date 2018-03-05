class CommentsController < ApplicationController
    
  def create
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end
    
    
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

    
end

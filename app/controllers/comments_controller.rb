class CommentsController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(comment_params)
    if @comment.save
      redirect_to link_path(params[:link_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_path(params[:link_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end

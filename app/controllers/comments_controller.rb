class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @comment.user, dog: @comment.dog if @comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to dog_path(params[:dog_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, dog_id: params[:dog_id])
  end
end

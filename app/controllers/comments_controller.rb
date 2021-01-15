class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, dog_id: params[:dog_id])
  end
end

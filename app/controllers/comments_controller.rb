class CommentsController < ApplicationController
  before_action :login_require

  def create
    @comment = Comment.create(text: params[:comment][:text], item_id: comment_params[:item_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id]) }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.permit(:text, :item_id, :user_id)
  end

  def login_require
    redirect_to new_user_session_path unless user_signed_in?
  end
end

class LikesController < ApplicationController
  def create
    @like = Like.new(get_params)
    if @like.save
      UserMailer.send_like_notification(params[:note_user_id],current_user.id).deliver_later
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.where(user_id: current_user.id, note_id: params[:id]).first
    @like.destroy
    UserMailer.send_unlike_notification(params[:id],current_user.id).deliver_later
    redirect_to root_path
  end

  private

  def get_params
    params.permit(:user_id, :note_id)
  end

end

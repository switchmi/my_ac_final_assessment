class LikesController < ApplicationController
  def create
    @like = Like.new(get_params)
    if @like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.where(user_id: current_user.id, note_id: params[:id]).first
    @like.destroy
    redirect_to root_path
  end

  private

  def get_params
    params.permit(:user_id, :note_id)
  end

end

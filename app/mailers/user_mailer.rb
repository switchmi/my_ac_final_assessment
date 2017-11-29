class UserMailer < ApplicationMailer
  def send_like_notification(user_id, other_user_id)
    byebug
    @user = User.find(user_id)
    @other_user = User.find(other_user_id)
    mail(to: @user.email, subject: "#{@other_user.name} has liked your post!")
  end

  def send_unlike_notification(user_id, other_user_id)
    @user = User.find(user_id)
    @other_user = User.find(other_user_id)
    mail(to: @user.email, subject: "#{@other_user.name} has unliked your post!")
  end

end

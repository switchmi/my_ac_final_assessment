class PagesController < ApplicationController
  def home
    @users = User.all
    @note = Note.new
    @notes = Note.all
    @followee_notes = current_user.feed
  end
end

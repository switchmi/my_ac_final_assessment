class PagesController < ApplicationController
  def home
    @users = User.all
    @note = Note.new
    @notes = Note.all
  end
end

class NotesController < ApplicationController
  def create
    @note = current_user.notes.new(get_params)
    if @note.save
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  private

  def get_params
    params.require(:note).permit(:title, :body)
  end
end

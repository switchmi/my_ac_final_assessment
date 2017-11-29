class NotesController < ApplicationController
  def create
    @note = current_user.notes.new(get_params)
    if @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(get_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path
  end

  private

  def get_params
    params.require(:note).permit(:title, :body)
  end
end

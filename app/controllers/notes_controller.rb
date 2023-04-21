class NotesController < ApplicationController
  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = current_user.notes.build
  end

  def edit
    @note = current_user.notes.find(params[:id])

    if @note.update(note_params)
      redirect_to note_url(@note), success: "ノート「#{@note.title}」を更新しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to note_url(@note), success: "ノート「#{@note.title}」を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:title)
  end
end

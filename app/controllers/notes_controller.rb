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
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to note_url(@note), success: "ノート「#{@note.title}」を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @note = current_user.notes.find(params[:id])

    if @note.update(note_params)
      flash.now[:success] = "ノート「#{@note.title}」を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])

    @note.destroy!
    redirect_to notes_url, success: "ノート「#{@note.title}」を削除しました。", status: :see_other
  end

  private

  def note_params
    params.require(:note).permit(:title)
  end
end

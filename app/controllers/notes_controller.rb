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
    @tags = @note.tags.pluck(:name)
  end

  def create
    @note = current_user.notes.build(note_params)
    tags = params[:note][:tags].split(',')
    
    if @note.save
      @note.save_notes_tags(tags)
      redirect_to note_url(@note), success: "ノート「#{@note.title}」を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @note = current_user.notes.find(params[:id])
    tags = params[:note][:tags].split(',')
    
    if @note.update(note_params)
      @note.save_notes_tags(tags)
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

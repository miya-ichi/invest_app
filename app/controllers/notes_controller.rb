class NotesController < ApplicationController
  def index
    if params[:tag]
      @tag = Tag.find_by(name: params[:tag])
      @own_notes = @tag.notes.where(user_id: current_user.id)
      @other_persons_notes = @tag.notes.where(private: false) - @own_notes
    else
      @own_notes = current_user.notes
      @other_persons_notes = Note.where(private: false) - @own_notes
    end
  end

  def show
    @note = Note.find(params[:id])
    # ノートが非公開かつ自身のものでない場合は表示させない
    redirect_to notes_url if @note.private && !current_user.own?(@note)
  end

  def new
    @note = current_user.notes.build
  end

  def edit
    @note = current_user.notes.find(params[:id])
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
    params.require(:note).permit(:title, :private)
  end
end

class NoteBlocksController < ApplicationController
  def create
    @note = current_user.notes.find(params[:note_id])
    @note_block = @note.note_blocks.create(note_block_params)
    redirect_to note_url(@note, anchor: @note_block.index)
  end

  def destroy
    @note = current_user.notes.find(params[:note_id])
    @note.note_blocks.find(params[:id]).destroy!
    redirect_to @note, status: :see_other
  end

  def note_block_params
    params.require(:note_block).permit(:content, :index)
  end
end

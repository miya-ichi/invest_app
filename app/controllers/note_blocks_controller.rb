class NoteBlocksController < ApplicationController
  def create
    @note = current_user.notes.find(params[:note_id])
    @note_block = @note.note_blocks.create(note_block_params)
    redirect_to @note
  end

  def note_block_params
    params.require(:note_block).permit(:content, :index)
  end
end

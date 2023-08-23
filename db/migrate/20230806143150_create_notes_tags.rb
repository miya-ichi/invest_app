class CreateNotesTags < ActiveRecord::Migration[7.0]
  def change
    create_table :notes_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
      t.index [:tag_id, :note_id], unique: true
    end
  end
end

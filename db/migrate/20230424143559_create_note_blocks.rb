class CreateNoteBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :note_blocks do |t|
      t.references :note, null: false, foreign_key: true
      t.text :content
      t.integer :index, null: false

      t.timestamps
    end
  end
end

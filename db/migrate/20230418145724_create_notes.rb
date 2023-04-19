class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.boolean :private, null: false, default: true

      t.timestamps
    end
  end
end
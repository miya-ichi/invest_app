class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.integer :category, null: false
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :website
      t.text :description
      t.string :sector

      t.timestamps
    end
  end
end

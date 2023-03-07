class CreatePossessions < ActiveRecord::Migration[7.0]
  def change
    create_table :possessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :volume, null: false
      t.float :price, null: false
      t.string :memo

      t.timestamps
    end
  end
end

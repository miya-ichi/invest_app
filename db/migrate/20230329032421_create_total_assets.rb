class CreateTotalAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :total_assets do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.float :price, null: false

      t.timestamps
      t.index [:user_id, :date], unique: true
    end
  end
end

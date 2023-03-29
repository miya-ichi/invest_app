class CreateTotalAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :total_assets do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.float :price

      t.timestamps
    end
  end
end

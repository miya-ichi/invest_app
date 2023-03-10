class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :stock, null: false, foreign_key: true
      t.date :date, null: false, index: { unique: true }
      t.float :market_open
      t.float :daily_high
      t.float :daily_row
      t.float :market_close, null: false

      t.timestamps
    end
  end
end

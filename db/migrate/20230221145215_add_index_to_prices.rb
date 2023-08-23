class AddIndexToPrices < ActiveRecord::Migration[7.0]
  def change
    remove_index :prices, :date
    remove_index :prices, :stock_id
    add_index :prices, [:stock_id, :date], unique: true
  end
end

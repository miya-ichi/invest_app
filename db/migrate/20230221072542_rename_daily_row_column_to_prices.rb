class RenameDailyRowColumnToPrices < ActiveRecord::Migration[7.0]
  def change
    rename_column :prices, :daily_row, :daily_low
  end
end

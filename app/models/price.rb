class Price < ApplicationRecord
  belongs_to :stock
end

# == Schema Information
#
# Table name: prices
#
#  id           :bigint           not null, primary key
#  daily_high   :float
#  daily_row    :float
#  date         :date             not null
#  market_close :float            not null
#  market_open  :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  stock_id     :bigint           not null
#
# Indexes
#
#  index_prices_on_date      (date) UNIQUE
#  index_prices_on_stock_id  (stock_id)
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#

class Price < ApplicationRecord
  belongs_to :stock

  validates :date, presence: true, uniqueness: { scope: :stock_id }
  validates :market_close, presence: true
end

# == Schema Information
#
# Table name: prices
#
#  id           :bigint           not null, primary key
#  daily_high   :float
#  daily_low    :float
#  date         :date             not null
#  market_close :float            not null
#  market_open  :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  stock_id     :bigint           not null
#
# Indexes
#
#  index_prices_on_stock_id_and_date  (stock_id,date) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#

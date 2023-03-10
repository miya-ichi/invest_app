FactoryBot.define do
  factory :price do
    stock
    date { Time.zone.today }
    market_open { 1.5 }
    daily_high { 1.5 }
    daily_low { 1.5 }
    market_close { 1.5 }
  end
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

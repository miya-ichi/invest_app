class Stock < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :possessions, dependent: :destroy

  validates :category, presence: true
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  def set_prices
    symbol = self.code
    symbol += '.T' if self.category.zero? # 日本株の場合、証券コードの末尾に.Tをつける
    query = BasicYahooFinance::Query.new
    data = query.quotes(symbol)

    prices.create(
      date: Time.zone.today,
      market_open: data[symbol]['regularMarketOpen'],
      daily_high: data[symbol]['regularMarketDayHigh'],
      daily_low: data[symbol]['regularMarketDayLow'],
      market_close: data[symbol]['regularMarketDayHigh']
    )
  end

  def update_prices
    symbol = self.code
    symbol += '.T' if self.category.zero? # 日本株の場合、証券コードの末尾に.Tをつける
    query = BasicYahooFinance::Query.new
    data = query.quotes(symbol)

    prices.update(market_close: data[symbol]['regularMarketDayHigh'])
  end

  def japanese?
    self.category.zero?
  end
end

# == Schema Information
#
# Table name: stocks
#
#  id          :bigint           not null, primary key
#  category    :integer          not null
#  code        :string           not null
#  description :text
#  name        :string           not null
#  sector      :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_stocks_on_code  (code) UNIQUE
#

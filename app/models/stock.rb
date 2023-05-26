class Stock < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :possessions, dependent: :destroy

  validates :category, presence: true
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  def set_prices
    symbol = self.code
    symbol += '.T' if self.category.zero? # 日本株の場合、証券コードの末尾に.Tをつける
    # query = BasicYahooFinance::Query.new
    # data = query.quotes(symbol)

    uri = "https://query2.finance.yahoo.com/v10/finance/quoteSummary/#{symbol}?modules=price"
    client = HTTPClient.new
    request = client.get(uri)
    response = JSON.parse(request.body)['quoteSummary']['result'][0]['price']

    prices.create(
      date: Time.zone.today,
      market_open: response['regularMarketOpen']['raw'],
      daily_high: response['regularMarketDayHigh']['raw'],
      daily_low: response['regularMarketDayLow']['raw'],
      market_close: response['regularMarketPrice']['raw']
    )
  end

  def update_prices
    symbol = self.code
    symbol += '.T' if self.category.zero? # 日本株の場合、証券コードの末尾に.Tをつける
    # query = BasicYahooFinance::Query.new
    # data = query.quotes(symbol)

    uri = "https://query2.finance.yahoo.com/v10/finance/quoteSummary/#{symbol}?modules=price"
    client = HTTPClient.new
    request = client.get(uri)
    response = JSON.parse(request.body)['quoteSummary']['result'][0]['price']

    prices.last.update(market_close: response['regularMarketPrice']['raw'])
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

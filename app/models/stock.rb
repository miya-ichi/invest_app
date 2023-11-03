class Stock < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :possessions, dependent: :destroy

  validates :category, presence: true
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  def set_prices
    symbol = self.code
    symbol += '.T' if self.japanese? # 日本株の場合、証券コードの末尾に.Tをつける

    uri = "https://query1.finance.yahoo.com/v8/finance/chart/#{symbol}?interval=1d"
    client = HTTPClient.new
    request = client.get(uri)
    response = JSON.parse(request.body)['chart']['result'][0]['indicators']['quote'][0]

    prices.create(
      date: Time.zone.today,
      market_open: response['open'][0],
      daily_high: response['high'][0],
      daily_low: response['low'][0],
      market_close: response['close'][0]
    )
  end

  def update_prices
    symbol = self.code
    symbol += '.T' if self.japanese? # 日本株の場合、証券コードの末尾に.Tをつける

    uri = "https://query1.finance.yahoo.com/v8/finance/chart/#{symbol}?interval=1d"
    client = HTTPClient.new
    request = client.get(uri)
    response = JSON.parse(request.body)['chart']['result'][0]['indicators']['quote'][0]

    prices.last.update(market_close: response['close'][0])
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

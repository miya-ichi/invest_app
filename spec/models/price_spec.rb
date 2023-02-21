require 'rails_helper'

RSpec.describe Price, type: :model do
  describe 'バリデーション' do
    it '日付は必須であること' do
      price = build(:price, date: nil)
      price.valid?
      expect(price.errors[:date]).to include('を入力してください')
    end

    it '日付は一意であること' do
      create(:price, date: Time.zone.today)
      price = build(:price, date: Time.zone.today)
      price.valid?
      expect(price.errors[:date]).to include('はすでに存在します')
    end

    it '終値は必須であること' do
      price = build(:price, market_close: nil)
      price.valid?
      expect(price.errors[:market_close]).to include('を入力してください')
    end
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

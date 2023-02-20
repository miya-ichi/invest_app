require 'rails_helper'

RSpec.describe Price, type: :model do
  decsribe 'バリデーション' do
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

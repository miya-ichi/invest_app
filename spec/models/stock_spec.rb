require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'バリデーション' do
    it 'カテゴリーは必須であること' do
      stock = build(:stock, category: nil)
      stock.valid?
      expect(stock.errors[:category]).to include('を入力してください')
    end

    it '証券コードは必須であること' do
      stock = build(:stock, code: nil)
      stock.valid?
      expect(stock.errors[:code]).to include('を入力してください')
    end

    it '証券コードは一意であること' do
      create(:stock, code: 1000)
      stock = build(:stock, code: 1000)
      stock.valid?
      expect(stock.errors[:code]).to include('はすでに存在します')
    end

    it '銘柄名は必須であること' do
      stock = build(:stock, name: nil)
      stock.valid?
      expect(stock.errors[:name]).to include('を入力してください')
    end
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

require 'rails_helper'

RSpec.describe TotalAsset, type: :model do
  describe 'バリデーション' do
    it '日付は必須であること' do
      total_asset = build(:total_asset, date: nil)
      total_asset.valid?
      expect(total_asset.errors[:date]).to include('を入力してください')
    end

    it '日付は一意であること' do
      total_asset_a = create(:total_asset, date: Time.zone.today)
      total_asset_b = build(:total_asset, user_id: total_asset_a.user_id, date: Time.zone.today)
      total_asset_b.valid?
      expect(total_asset_b.errors[:date]).to include('はすでに存在します')
    end

    it '総資産額は必須であること' do
      total_asset = build(:total_asset, price: nil)
      total_asset.valid?
      expect(total_asset.errors[:price]).to include('を入力してください')
    end
  end
end

# == Schema Information
#
# Table name: total_assets
#
#  id         :bigint           not null, primary key
#  date       :date             not null
#  total_asset      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_total_assets_on_date     (date) UNIQUE
#  index_total_assets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

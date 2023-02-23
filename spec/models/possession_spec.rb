require 'rails_helper'

RSpec.describe Possession, type: :model do
  describe 'バリデーション' do
    it '数量は必須であること' do
      possession = build(:possession, volume: nil)
      possession.valid?
      expect(possession.errors[:volume]).to include('を入力してください')
    end

    it '価格は必須であること' do
      possession = build(:possession, price: nil)
      possession.valid?
      expect(possession.errors[:price]).to include('を入力してください')
    end
  end
end

# == Schema Information
#
# Table name: possessions
#
#  id         :bigint           not null, primary key
#  memo       :string
#  price      :float            not null
#  volume     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stock_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_possessions_on_stock_id  (stock_id)
#  index_possessions_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#  fk_rails_...  (user_id => users.id)
#

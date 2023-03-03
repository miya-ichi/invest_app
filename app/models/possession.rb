class Possession < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validate :stock_id_is_valid
  validates :volume, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :memo, length: { maximum: 50 }

  def print_stock_totals_and_changes
    today = self.stock.prices[-1].market_close * self.volume
    buy = self.price * self.volume
    change = "#{'+' if today > buy}#{((today - buy) / buy * 100).round(2)}%"

    "#{today.to_fs(:delimited)}#{self.stock.japanese? ? '円' : '＄'}(#{change})"
  end

  private

  def stock_id_is_valid
    errors.add(:stock_id, '一覧から選択してください') unless Stock.find_by(id: stock_id)
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

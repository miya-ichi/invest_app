class Possession < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :stock_id, presence: true
  validates :volume, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :memo, length: { maximum: 50 }
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

class User < ApplicationRecord
  has_many :possessions, dependent: :destroy
  has_many :stocks, through: :possessions
  has_many :total_assets, dependent: :destroy
  has_many :notes, dependent: :destroy

  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def calculate_total_asset
    total_asset = self.possessions.includes(stock: :prices).sum do |possession|
      if possession.stock.japanese?
        possession.total_price
      else
        possession.total_price_to_jpy
      end
    end

    today_record = self.total_assets.find_or_create_by(date: Time.zone.today)
    today_record.update(price: total_asset) if today_record.price != total_asset
  end
end

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  admin            :boolean          default(FALSE), not null
#  crypted_password :string
#  email            :string           not null
#  salt             :string
#  username         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

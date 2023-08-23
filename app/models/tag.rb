class Tag < ApplicationRecord
  has_many :notes_tags, dependent: :destroy
  has_many :notes, through: :notes_tags

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(30)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

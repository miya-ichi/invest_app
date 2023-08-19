class Note < ApplicationRecord
  belongs_to :user
  has_many :note_blocks, dependent: :destroy
  has_many :notes_tags, dependent: :destroy
  has_many :tags, through: :notes_tags

  validates :title, presence: true, length: { maximum: 50 }
  validates :private, inclusion: [true, false]

  def save_notes_tags(tags)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(name: old_name))
    end

    new_tags.each do |new_name|
      notes_tag = Tag.find_or_create_by(name: new_name[0..29])
      self.tags << notes_tag
    end
  end
end

# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  private    :boolean          default(TRUE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

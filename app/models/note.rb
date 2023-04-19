class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :private, presence: true
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

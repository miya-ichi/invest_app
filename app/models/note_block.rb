class NoteBlock < ApplicationRecord
  belongs_to :note

  validates :index, presence: true
end

# == Schema Information
#
# Table name: note_blocks
#
#  id         :bigint           not null, primary key
#  content    :text
#  index      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint           not null
#
# Indexes
#
#  index_note_blocks_on_note_id  (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#

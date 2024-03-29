class NotesTag < ApplicationRecord
  belongs_to :tag
  belongs_to :note

  validates :tag_id, uniqueness: { scope: :note_id }
end

# == Schema Information
#
# Table name: notes_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_notes_tags_on_note_id             (note_id)
#  index_notes_tags_on_tag_id              (tag_id)
#  index_notes_tags_on_tag_id_and_note_id  (tag_id,note_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'rails_helper'

RSpec.describe NotesTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
#  index_notes_tags_on_note_id  (note_id)
#  index_notes_tags_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'rails_helper'

RSpec.describe TotalAsset, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: total_assets
#
#  id         :bigint           not null, primary key
#  date       :date             not null
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_total_assets_on_date     (date) UNIQUE
#  index_total_assets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

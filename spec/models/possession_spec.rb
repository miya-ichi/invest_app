require 'rails_helper'

RSpec.describe Possession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: possessions
#
#  id         :bigint           not null, primary key
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

FactoryBot.define do
  factory :tag do
    name { 'MyString' }
  end
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

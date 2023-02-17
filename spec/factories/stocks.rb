FactoryBot.define do
  factory :stock do
    category { 0 }
    code { '1000' }
    name { '日本株式' }
    website { 'https://example.com' }
    description { '日本の上場企業の概要を登録する' }
    sector { 'テスト' }
  end
end

# == Schema Information
#
# Table name: stocks
#
#  id          :bigint           not null, primary key
#  category    :integer          not null
#  code        :string           not null
#  description :text
#  name        :string           not null
#  sector      :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_stocks_on_code  (code) UNIQUE
#

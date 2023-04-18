FactoryBot.define do
  factory :note do
    user { nil }
    title { "MyString" }
    private { false }
  end
end

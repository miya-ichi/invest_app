FactoryBot.define do
  factory :stock do
    category { 1 }
    code { "MyString" }
    name { "MyString" }
    website { "MyString" }
    description { "MyText" }
    sector { "MyString" }
  end
end

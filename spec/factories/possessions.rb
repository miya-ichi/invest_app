FactoryBot.define do
  factory :possession do
    user { nil }
    stock { nil }
    volume { 1 }
    price { 1.5 }
  end
end

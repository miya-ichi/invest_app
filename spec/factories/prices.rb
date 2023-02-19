FactoryBot.define do
  factory :price do
    stock { nil }
    date { "2023-02-20" }
    market_open { 1.5 }
    daily_high { 1.5 }
    daily_row { 1.5 }
    market_close { 1.5 }
  end
end

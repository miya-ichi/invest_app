FactoryBot.define do
  factory :price do
    stock
    date { Time.zone.today }
    market_open { 1.5 }
    daily_high { 1.5 }
    daily_row { 1.5 }
    market_close { 1.5 }
  end
end

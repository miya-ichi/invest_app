require 'csv'

puts 'Start inserting seed "stocks[japan]"'

i = 0
CSV.foreach('./db/seeds/japan_stocks.csv', headers: true) do |row|
  Stock.create(category: 0, code: row['code'], name: row['name'])
end

puts '"stocks[japan]" are inserted!'

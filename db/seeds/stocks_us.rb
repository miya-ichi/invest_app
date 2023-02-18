require 'csv'

puts 'Start inserting seed "stocks[us]"'

CSV.foreach('./db/seeds/us_stocks.csv', headers: true) do |row|
  Stock.create(category: 1, code: row['code'], name: row['name'])
end

puts '"stocks[us]" are inserted!'

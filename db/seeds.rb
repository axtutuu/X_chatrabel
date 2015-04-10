# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"
CSV.foreach('config/files/prefecture.csv') do |row|
  Prefecture.create(:id => row[0], :name => row[1])
end

city_id = 1
CSV.foreach('config/files/cities.csv') do |row|
  City.create(:id => city_id, :prefecture_id => row[0], :name => row[1], :kana => row[2])
  city_id += 1
end

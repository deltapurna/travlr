# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Place.create([
  { name: 'Eiffel Tower', latitude: 48.85837, longitude: 2.294481 },
  { name: 'Statue of Liberty', latitude: 40.689249, longitude: -74.0445 },
  { name: 'Prambanan Temple', latitude: -7.751919, longitude: 110.492006 },
  { name: 'Jalan Malioboro', latitude: -7.7928243, longitude: 110.3657798 },
  { name: 'Merlion', latitude: 1.286848, longitude: 103.854532 }
])

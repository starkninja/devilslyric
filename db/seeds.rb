# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'God', password: 'mushr00mphone', balance: 100000000, bio: 'Look on my works, ye mighty, and despair!', avatar_link: 'God005.jpg')

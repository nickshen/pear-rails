# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Kyle Tse', email: 'kyle@pear.com', password: 'kyletse', age: 24, deleted?: false)
User.create(name: 'Nick Shen', email: 'nick@pear.com', password: 'nickshen', age: 30, deleted?: false)
User.create(name: 'Alex Nakagawa', email: 'alex@pear.com', password: 'nakagawa', age: 2, deleted?: true)
User.create(name: 'Makena Fetzer', email: 'makena@pear.com', password: 'fetzer', age: 19, deleted?: false)
User.create(name: 'Evan Chang', email: 'evan@pear.com', password: 'evanchang', age: 13, deleted?: false)
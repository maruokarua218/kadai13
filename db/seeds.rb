# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'qq', email: 'qq@gmail.com', password: 'qqdayo', admin: false )
User.create(name: 'aa', email: 'aa@gmail.com', password: 'aadayo', admin: true )
Label.create(name: 'テスト1')
Label.create(name: 'テスト2')

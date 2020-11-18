# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pong.create({pong: 'PONG'})
user = User.create(email: "bartek@mail.com", password: "1234")
user.boards.create(name: "project B 1")
user.boards.create(name: "project B 2")
user.boards.create(name: "project B 3")
user.boards.create(name: "project B 4")

user = User.create(email: "michal@mail.com", password: "zeed")
user.boards.create(name: "project M 1")
user.boards.create(name: "project M 2")
user.boards.create(name: "project M 3")

user = User.create(email: "hubert@mail.com", password: "123")
user.boards.create(name: "project H 1")
user.boards.create(name: "project H 2")




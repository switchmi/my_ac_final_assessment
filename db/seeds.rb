# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Joker', email: 'jl0@gmai.com', password: '111111', password_confirmation: '111111')
User.create(name: 'Penguin', email: 'jl1@gmai.com', password: '111111', password_confirmation: '111111')
User.create(name: 'Superman', email: 'jl2@gmai.com', password: '111111', password_confirmation: '111111')
User.create(name: 'Bane', email: 'jl3@gmai.com', password: '111111', password_confirmation: '111111')
User.create(name: 'Catwoman', email: 'jl4@gmai.com', password: '111111', password_confirmation: '111111')
Note.create(title: 'Something Useful', body: 'Not so useful but ok', user_id: '1')
Note.create(title: 'Something Useful', body: 'Not so useful but ok', user_id: '2')
Note.create(title: 'Something Useful', body: 'Not so useful but ok', user_id: '3')
Note.create(title: 'Something Useful', body: 'Not so useful but ok', user_id: '4')
Note.create(title: 'Something Useful1', body: 'Not so useful but ok', user_id: '1')
Note.create(title: 'Something Useful2', body: 'Not so useful but ok', user_id: '2')
Like.create(user_id: '1', note_id: '2')
Like.create(user_id: '2', note_id: '3')
Like.create(user_id: '3', note_id: '4')
Like.create(user_id: '4', note_id: '2')
Like.create(user_id: '5', note_id: '2')

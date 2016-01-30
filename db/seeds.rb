# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'
require 'faker'
User.create(email: 'test@ya.ru', password: '123123', password_confirmation: '123123')
FactoryGirl::create_list(:user, 10)
User.all.each do |user|
  FactoryGirl::create_list(:task, rand(3), user: user)
end
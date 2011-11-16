# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(
  :email => 'admin_test@test.com',
  :password => '123456',
  :password_confirmation => '123456',
  :username =>'admin_test')
user.save!
user.is_admin = true
user.save!

user = User.new(
  :email => 'user1@test.com',
  :password => '123456',
  :password_confirmation => '123456',
  :username =>'user1')
user.save!

user = User.new(
  :email => 'user2@test.com',
  :password => '123456',
  :password_confirmation => '123456',
  :username =>'user2')
user.save!

user = User.new(
  :email => 'user3@test.com',
  :password => '123456',
  :password_confirmation => '123456',
  :username =>'user3')
user.save!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Group.delete_all
Message.delete_all
User.delete_all
Attachment.delete_all
Conversation.delete_all
Reply.delete_all
Recipient.delete_all

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

group = Group.new(
  :name => 'ByeBye Bunny')
group.save!

group = Group.new(
  :name => 'Deadly Icarus')
group.save!
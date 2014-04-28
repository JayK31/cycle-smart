# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

TrafficIncident.delete_all

user1 = User.create(name: "Jay", email: "jay@jay.com", password: "password", password_confirmation: "password")
user2 = User.create(name: "Tom", email: "tom@tom.com", password: "password", password_confirmation: "password")
user3 = User.create(name: "Mike", email: "mike@mike.com", password: "password", password_confirmation: "password")

TrafficIncident.fetch


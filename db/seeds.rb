# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

user1 = User.create(name: "Jay", email: "jay@jay.com", password: "password", password_confirmation: "password")
user2 = User.create(name: "Tom", email: "tom@tom.com", password: "password", password_confirmation: "password")
user3 = User.create(name: "Mike", email: "mike@mike.com", password: "password", password_confirmation: "password")

# TrafficIncident.delete_all

# responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
# responses.each do |accident|
  
# @@bike_accidents.each do |accident|
#   TrafficIncident.create(latitude: self.latitude, longitude: self.longitude)
# end


# potholes.each do |pothole|
#   a = Pothole.create(unique_key: pothole[1], created_at_date: pothole[2], zipcode: pothole[3], address: "#{pothole[4]}", latitude: pothole[5], longitude: pothole[6])
# end
#0 : "Unique.Key",
#1 : "Created.Date",
#2 : "Incident.Zip",
#3 : "Incident.Address",
#4 : "Latitude",
#5 : "Longitude"

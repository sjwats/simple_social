# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

activities_file = Rails.root.join('db/data/activities.csv')

CSV.foreach(activities_file, headers: true) do |row|
  activity = Activity.find_or_initialize_by(name: row[0]) do |activity_name|
    activity_name[:name] = row[0]
  end
  activity.save
end

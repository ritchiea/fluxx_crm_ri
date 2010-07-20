# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

group = Group.create :name => 'Northern'
group = Group.create :name => 'Southern'
group = Group.create :name => 'Western'
group = Group.create :name => 'Eastern'


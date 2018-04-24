# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  name  = "water"
  value = rand(1..4)
  description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
		tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
		quis nostrud exercie velit esscillum dolore eu fugiat nulla pariatur. 
		proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  bit = 001010000
  price = 2
  BASE_CMD_TBL.create!(CMD_ID:  name,
               DESCRIPTION: value,
               SUBSYSTEM: 1,
               FORMATION_TYPE: description,
               CMD_TYPE: 1,
  				BASE_CMD_CODE: value,
  				BASE_CMD_MASK: value,
  				CRITICALITY: value,
  				PULSE_WIDTH: value,
  				MAP_ID: value,
  				UI_TYPE: 1,
  				PREFERRABLE_DECODER: value,
  				CONFIRMATION_TYPE: '["1","3"]',
  				REMARKS: value)
end
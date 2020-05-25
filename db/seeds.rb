# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Create a Venue for use

Venue.destroy_all

# Set number of rows and colimns for layout
rows = rand 26
columns = rand 26
letters_array = ('a'..'z').to_a
status = ['AVAILABLE', 'UNAVAILABLE']

# Create venue and layout
venue = Venue.create(name: 'Gand Cinema')
layout = Layout.create(venue: venue, rows: rows, columns: columns)

# Create seats for layout
for i in 1..layout.rows
  for j in 1..layout.columns
    Seat.create(row: letters_array[i-1], column: j, status: status.sample, layout: layout)
  end
end




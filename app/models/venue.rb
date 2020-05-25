class Venue < ApplicationRecord
  has_one :layout, dependent: :destroy

  validates_presence_of :name

  def self.reset
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
  end
end

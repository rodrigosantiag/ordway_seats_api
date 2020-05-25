class Layout < ApplicationRecord
  belongs_to :venue
  has_many :seats, dependent: :destroy

  validates_presence_of :rows, :columns

  LETTERS_ARRAY = ('a'..'z').to_a

  def get_best_seats(number_of_seats)
    best_column = (self.columns / 2.to_f).ceil

    #  Check if have enough seats on best row and define best row available
    seats_group = []
    for i in 0..self.rows
      row = LETTERS_ARRAY[i]
      all_seats_in_row = self.seats.where(row: row)
      best_seat_in_row = self.seats.find_by_row_and_column(row, best_column)
      best_index = number_of_seats / 2

      #  get sequence of seats available
      all_seats_in_row.each_cons(number_of_seats) { |seat| seats_group << seat if seat.all? { |s| s.status == "AVAILABLE" } }

      if seats_group.size.zero?
        next
      else
        # byebug
        seats_in_best_palce = seats_group.detect { |s| (s.include?(best_seat_in_row) && s[best_index] == best_seat_in_row) }
        return seats_in_best_palce unless seats_in_best_palce.blank?
        seats_in_better_place = seats_group.detect { |s| s.include?(best_seat_in_row) }
        return seats_in_better_place unless seats_in_better_place.blank?
        return seats_group.first
      end
    end
    return seats_group
  end
end

class Seat < ApplicationRecord
  belongs_to :layout

  validates_presence_of :row, :column, :status
end

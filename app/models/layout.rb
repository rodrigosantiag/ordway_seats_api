class Layout < ApplicationRecord
  belongs_to :venue
  has_many :seats
end

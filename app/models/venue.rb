class Venue < ApplicationRecord
  has_one :layout, dependent: :destroy

  validates_presence_of :name
end

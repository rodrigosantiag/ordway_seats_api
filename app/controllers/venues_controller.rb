class VenuesController < ApplicationController
  def index
    render jsonapi: Venue.first,
           include: [:layout]
  end

  def find_best_seat
    number_of_seats = params[:seats].to_i
    venue = Venue.first

    # get best row for number of seats requested
    best_places = venue.layout.get_best_seats(number_of_seats)

    render jsonapi: best_places

  end

  def reset
    Venue::reset

    render jsonapi: Venue.first,
           include: [:layout]
  end
end

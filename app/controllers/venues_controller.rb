class VenuesController < ApplicationController
  def index
    venues = Venue.all.order(:name)

    render json: venues, status: 200
  end
end

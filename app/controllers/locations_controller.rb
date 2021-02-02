class LocationsController < ApplicationController
  def index
    @locations = Location.joins(:vendor).order('vendors.name')
  end

  def restaurants
    @locations = Location.joins(:vendor)
                         .where(location_type: 0)
                         .order('vendors.name')
  end
end

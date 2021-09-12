class LocationsController < ApplicationController
  def index
    @locations = Location.joins(:vendor).order('vendors.name')
  end

  def restaurants
    @locations = Location.joins(:vendor)
                         .where(location_type: 0)
                         .order('vendors.name')
  end

  def show
    @loc = Location.find(params[:id])

  end


  def states
  end

  def by_state
    redirect_to restaurants_url unless params[:state].present?
    redirect_to restaurants_url unless state_is_valid(params[:state]) 
    @locations = Location.joins(:vendor)
                         .where(state: params[:state], location_type: 0)
                         .order('vendors.name')
    render "index"
  end

  def state_is_valid state
    valid_us_states.include? state.upcase
  end

  def valid_us_states
    ["SC", "NC"]
  end
end

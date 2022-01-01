class LocationsController < ApplicationController
  def index
    @locations = Location.joins(:vendor).order('vendors.name')
  end

  def restaurants
    @locations = Location.joins(:vendor)
                         .where(location_type: 0)
                         .order('vendors.name')
  end

  def new
    redirect_to vendors_path unless user_signed_in?
    @location = Location.new
    if params[:vendor_id] 
      vendor = Vendor.find(params[:vendor_id])
      @location.vendor = vendor
    else
      redirect_to vendors_path
    end
  end

  def create
    redirect_to vendors_path unless user_signed_in?
    location = Location.create(location_params)
    redirect_to vendor_path(location.vendor_id)
  end

  def update
    redirect_to vendors_path unless user_signed_in?
    location = Location.find(params[:id])
    location.update(location_params)
    redirect_to vendor_path(location.vendor_id)
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    redirect_to vendors_path unless user_signed_in?
    @location = Location.find(params[:id])
  end

  def destroy
    redirect_to vendors_path unless user_signed_in?
    @location = Location.find(params[:id])
    vendor = @location.vendor
    @location.delete
    redirect_to vendor_path(vendor)
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

  private
  def location_params
    params.require(:location).permit(:latitude, :longitude, :address_1,
                                     :address_2, :city,  :state, :postal_code,
                                     :hours, :phone, :vendor_id)
  end
end

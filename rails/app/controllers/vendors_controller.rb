class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all.order(:name)
  end

  def new
    redirect_to vendors_path unless user_signed_in?
    @vendor = Vendor.new
  end

  def create
    redirect_to vendors_path unless user_signed_in?
    Vendor.create(vendor_params)
    redirect_to vendor_path
  end

  def edit
    redirect_to vendors_path unless user_signed_in?
    @vendor = Vendor.find_by(id: params[:id].to_i)
    @locations = Location.where(vendor_id: @vendor.id)
  end

  def update
    redirect_to vendors_path unless user_signed_in?
    vendor = Vendor.find_by(id: params[:id].to_i)
    vendor.update(vendor_params)
    redirect_to vendors_path
  end

  def show
    @vendor = Vendor.find_by(id: params[:id].to_i)
    @locations = Location.where(vendor_id: @vendor.id)
  end

  def destroy
    redirect_to vendors_path unless user_signed_in?
    @vendor = Vendor.find_by(id: params[:id].to_i)
    @vendor.destroy
    redirect_to vendors_path
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :website, :status)
    end
end

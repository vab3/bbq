class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all.order(:name)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    Vendor.create(vendor_params)
    redirect_to vendors_path
  end

  def edit
    @vendor = Vendor.find_by(id: params[:id])
  end

  def update
    vendor = Vendor.find_by(id: params[:id])
    vendor.update(vendor_params)
    redirect_to vendors_path
  end

  def show
    @vendor = Vendor.find_by(id: params[:id])
  end

   private
    def vendor_params
      params.require(:vendor).permit(:name, :website, :status)
    end
end

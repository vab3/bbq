class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all.order(:name)
  end
end

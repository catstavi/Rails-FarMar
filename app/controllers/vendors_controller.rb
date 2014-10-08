class VendorsController < ApplicationController
  def new
  end

  def create
    @vendor = Vendor.new
  end

end

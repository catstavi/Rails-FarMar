class VendorsController < ApplicationController

  # def index
  #   @vendors = Vendor.all
  # end

  def login
  ends

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:name))
    if @vendor.save
      redirect_to root_path
    else
      render :new
      # refers to file name
    end
  end

end

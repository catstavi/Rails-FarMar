class VendorsController < ApplicationController

  # def index
  #   @vendors = Vendor.all
  # end

  def login
    @vendor = Vendor.find(params[:vendor][:id])
    if @vendor.name != params[:vendor][:name]
      redirect_to "/404"
    else
      session[:vendor_id] = @vendor.id
      redirect_to root_path
    end
  end

  def home
    if session[:vendor_id] != nil
      @vendor = Vendor.find(session[:vendor_id])
    end
  end

  def logout
    session[:vendor_id] = nil
    redirect_to root_path
  end

  def display
    @vendors = Vendor.all
  end

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

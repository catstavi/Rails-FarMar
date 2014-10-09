class VendorsController < ApplicationController

  def login
    if good_id?(params[:vendor][:id]) #id doesn't exist
      @vendor = Vendor.find(params[:vendor][:id])
      if @vendor.name != params[:vendor][:name] #id and name don't match
        redirect_to "/404"
      else
        session[:vendor_id] = @vendor.id
        redirect_to root_path
      end
    else
      redirect_to "/404"
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

  def good_id?(id)
    id_int = id.to_i
    if (id_int > Vendor.count) || (id_int <= 0)
      return false
    else
      return true
    end
  end

end

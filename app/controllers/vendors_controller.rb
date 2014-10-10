class VendorsController < ApplicationController

  def login
    @vendor = Vendor.find_by(id: params[:vendor][:id])
    if !@vendor || @vendor.name != params[:vendor][:name] #id and name don't match
      redirect_to "/"
    else
      session[:vendor_id] = @vendor.id
      redirect_to root_path
    end
  end

  def home
    if session[:vendor_id] != nil
      @vendor = Vendor.find(session[:vendor_id])
      if @vendor.market_id
        @market = Market.find(@vendor.market_id)
      end
    end
  end

  def logout
    session[:vendor_id] = nil
    redirect_to root_path
  end

  def display
    @vendors = Vendor.all
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

  def set_market
    @vendor = Vendor.find(session[:vendor_id])
    @vendor.update_attribute(:market_id, params[:id])
    redirect_to "/markets"
  end

  private

  def edit
    # raise params.inspect
    @vendor = Vendor.find(params[:id])
  end

  def update
    #raise params.inspect
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
    redirect_to "/vendors" #changed here! - this should help redirect to /vendors after an edit has been made

    else
      render :edit
    end
  end

  def vendor_params
    params.require(:vendor).permit(:name)
  end

end

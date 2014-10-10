class MarketsController < ApplicationController

  def display #name of the erb file
    @markets = Market.all
    @vendor = logged_vendor
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to "/markets"
    else
      render :new
    end
  end

  def by_id
    @market = Market.find(params[:id])
    @vendor = logged_vendor
    vendors = Vendor.where("market_id = #{@market.id}")
    @vendor_list = vendors_string(vendors)
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    if your_market?
      @market.update(market_params)
      redirect_to "/markets"
    else
      redirect_to"/markets"
    end
  end

  def delete
    if your_market?      #only the owner of the product can delete it
      @market.destroy
      redirect_to "/markets"
    else
      redirect_to "/markets"
    end
  end

  private

    def market_params
      params.require(:market).permit(:name, :location)
    end

    def your_market?
      @market = Market.find(params[:id])
      @vendor = logged_vendor
      @vendor.market_id == @market.id ? true : false
    end

    def logged_vendor
      if session[:vendor_id] == nil
        return nil
      else
        Vendor.find(session[:vendor_id])
      end
    end

    def vendors_string(vendors)
      array = vendors.collect { |vendor| vendor.name }
      array.join(', ')
    end

end

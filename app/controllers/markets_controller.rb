class MarketsController < ApplicationController

  def display #name of the erb file
    @vendor = logged_vendor
    @markets = Market.all
  end

  def new
    @vendor = logged_vendor
    @market = Market.new
  end

  def create
    @vendor = logged_vendor
    @market = Market.new(market_params)
    if @market.save
      redirect_to "/markets"
    else
      render :new
    end
  end

  def by_id
    @vendor = logged_vendor
    @market = Market.find_by(id: params[:id])
    if @market
      vendors = Vendor.where("market_id = #{@market.id}")
      @vendor_list = make_joined_string(vendors)
      products = vendors.collect do |vendor|
        Product.where("vendor_id = #{vendor.id}")
      end
      products.flatten!
      @product_list = make_joined_string(products)
    else
      redirect_to "/markets"
    end
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
      vendors = Vendor.find_by("market_id: #{@market.id}")
      vendors.each { |vendor| vendor.market_id = nil }
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

end

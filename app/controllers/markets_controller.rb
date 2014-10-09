class MarketsController < ApplicationController

  def display #name of the erb file
    @markets = Market.all
    @vendor = Vendor.find(session[:vendor_id])
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
    if params[:id].to_i > Market.count
      redirect_to "/404"
    else
      @market = Market.find(params[:id])
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_params)
    redirect_to "/markets"
  end

  private

    def market_params
      params.require(:market).permit(:name, :location)
    end

end

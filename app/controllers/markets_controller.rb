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
    if good_id?(params[:id])
      @market = Market.find(params[:id])
    else
      redirect_to "/markets"
    end
  end

  def update
    if good_id?(params[:id])
      @market = Market.find(params[:id])
      @market.update(market_params)
      redirect_to "/markets"
    else
      redirect_to "/404" #user has editted ID field to one that doens't exit
    end
  end

  private

    def market_params
      params.require(:market).permit(:name, :location)
    end

    def good_id?(id)
      id_int = id.to_i
      if (id_int > Market.count) || (id_int <= 0)
        return false
      else
        return true
      end
    end

end

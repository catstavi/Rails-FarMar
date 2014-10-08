class MarketsController < ApplicationController

  def displayMarket #name of the erb file
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(params.require(:market).permit(:name, :location))
    if @market.save
      redirect_to "/markets"
    else
      render :new
    end
  end

  def by_id
    @market = Market.find(params[:id])
  end
  
end

class MarketsController < ApplicationController

  def display #name of the erb file
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
    if params[:id].to_i > Market.count
      redirect_to "/404"
    else
      @market = Market.find(params[:id])
    end
  end

end

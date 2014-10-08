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

  def edit
    if params[:id].to_i > Market.count
      redirect_to "/404"
    else
      @market = Market.find(params[:id])
    end
  end

  def update
    # raise params.inspect
    id_int = params[:market][:id].to_i
    if id_int > Market.count || id_int < 0
      redirect_to "/404" #user has editted ID field to one that doens't exit
    else
      @market = Market.find(params[:market][:id])
      @market.name = params[:market][:name]
      @market.location = params[:market][:location]
      @market.save
      redirect_to "/markets"
    end
  end
end

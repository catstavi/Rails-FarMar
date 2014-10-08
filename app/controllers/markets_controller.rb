class MarketsController < ApplicationController

  def displayMarket #name of the erb file
    @markets = Market.all
  end
end

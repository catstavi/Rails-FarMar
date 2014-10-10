class SalesController < ApplicationController

  def display #name of the erb file
    @vendor = logged_vendor
    @sales = Sale.where("vendor_id = #{session[:vendor_id]}")
    @total_sales = sum_sales(@sales)
  end

  def sum_sales(sales)
    sum = 0
    sales.each {|sale| sum += sale.amount}
    sum
  end

  def new
    @sale = Sale.new
    @product = Product.find(params[:id])
    @vendor = logged_vendor
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to "/products/#{params[:sale][:product_id]}"
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
  end

end

class ProductsController < ApplicationController

  def display #name of the erb file
    @vendor = Vendor.find(session[:vendor_id])
    @products = Product.where("vendor_id = #{session[:vendor_id]}")
  end

  def new
    @vendor = Vendor.find(session[:vendor_id])
    @product = Market.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to "/products"
    else
      render :new
    end
  end

  def by_id
    @product = Product.find(params[:id])
    @this_vendor = Vendor.find(@product.vendor_id)
  end

  def edit
    if good_id?(params[:id])
      @product = Product.find(params[:id])
    else
      redirect_to "/products"
    end
  end

  def update
    if good_id?(params[:id])
      @product = Product.find(params[:id])
      @product.update(product_params)
      redirect_to "/products"
    else
      redirect_to "/404" #user has editted ID field to one that doens't exit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @vendor = Vendor.find(session[:vendor_id])
    if @product.vendor_id = @vendor.id      #only the owner of the product can delete it
      @product.destroy
      redirect_to "/products"
    else
      redirect_to "/products"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end

  def good_id?(id)
    id_int = id.to_i
    if (id_int > Product.count) || (id_int <= 0)
      return false
    else
      return true
    end
  end

end

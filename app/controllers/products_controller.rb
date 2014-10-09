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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to "/products/#{params[:id]}"
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

end

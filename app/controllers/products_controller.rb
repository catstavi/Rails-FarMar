class ProductsController < ApplicationController

  def display_my #name of the erb file
    @vendor = logged_vendor
    @products = Product.where("vendor_id = #{session[:vendor_id]}")
  end

  def display_all
    @vendor = logged_vendor
    @products = Product.all
  end

  def new
    @vendor = logged_vendor
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
    @vendor = logged_vendor
    @product = Product.find_by(id: params[:id])
    if @product
      @this_vendor = Vendor.find(@product.vendor_id)
      @sales = Sale.where("product_id = #{@product.id}")
    else
      redirect_to "/all_products"
    end
  end

  def edit
    @vendor = logged_vendor
    @product = Product.find(params[:id])
  end

  def update
    if your_product?
      @product.update(product_params)
      redirect_to "/products/#{params[:id]}"
    else
      redirect_to "/products/#{params[:id]}"
    end
  end

  def delete
    if your_product?     #only the owner of the product can delete it
      @sales = Sale.where("product_id = #{@product.id}")
      @sales.each { |sale| sale.destroy }
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

  def your_product?
    @product = Product.find(params[:id])
    @vendor = logged_vendor
    @product.vendor_id == @vendor.id ? true : false
  end

end

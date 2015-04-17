class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create    
    product = Product.new(product_params)

    if product.save
      notice = "Product berhasil di buat."
    else
      notice = "Product gagal di buat. Hubungi administrator."
    end
    redirect_to products_path, :notice => notice
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])

    if product.update_attributes(product_params)
      notice = "Product berhasil di update."
    else
      notice = "Product gagal di update. Hubungi administrator."
    end
    redirect_to products_path, :notice => notice
  end


  private

  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end
end

class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @product = Product.new
    @products = Product.all
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


  private

  def product_params
    params.require(:product).permit(:name, :merk_id, :image)
  end
end

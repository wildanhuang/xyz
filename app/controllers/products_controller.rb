class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @resources = Resource.all
  end

  def create
    product = Product.new(product_params)

    if product.save
      if params[:ingredients]
        params[:ingredients].each do |key, data|
          if data[:name]
            ingredient = Ingredient.new
            ingredient.product_id = product.id
            ingredient.resource_id = key
            ingredient.rate_percent = data[:rate_percent]
            ingredient.save
          end
        end
      end
      notice = "Product berhasil di buat."
    else
      notice = "Product gagal di buat. Hubungi administrator."
    end
    redirect_to products_path, :notice => notice
  end

  def edit
    @product = Product.find(params[:id])
    @resources = Resource.all
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

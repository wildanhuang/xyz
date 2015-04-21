class SalesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @products = Product.all.collect{|x|[x.name, x.id]}
    @customers = Customer.all.collect{|x|[x.name, x.id]}
  end

  def create    
    sale = Sale.new(sale_params)

    if sale.save
      sale.product.update_attribute('quantity', (sale.product.quantity - sale.quantity))
      notice = "Sale berhasil di buat."
    else
      notice = "Sale gagal di buat. Hubungi administrator."
    end
    redirect_to sales_path, :notice => notice
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    sale = Sale.find(params[:id])

    if sale.update_attributes(sale_params)
      notice = "Sale berhasil di update."
    else
      notice = "Sale gagal di update. Hubungi administrator."
    end
    redirect_to sales_path, :notice => notice
  end

  private

  def sale_params
    params.require(:sale).permit(:product_id, :customer_id, :date, :quantity, :total_price)
  end
end

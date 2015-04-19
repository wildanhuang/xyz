class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create    
    customer = Customer.new(customer_params)

    if customer.save
      notice = "Customer berhasil di buat."
    else
      notice = "Customer gagal di buat. Hubungi administrator."
    end
    redirect_to customers_path, :notice => notice
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])

    if customer.update_attributes(customer_params)
      notice = "customer berhasil di update."
    else
      notice = "customer gagal di update. Hubungi administrator."
    end
    redirect_to customers_path, :notice => notice
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :phone)
  end
end

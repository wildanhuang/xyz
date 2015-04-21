class SuppliersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create    
    supplier = Supplier.new(supplier_params)

    if supplier.save
      notice = "Supplier berhasil di buat."
    else
      notice = "Supplier gagal di buat. Hubungi administrator."
    end
    redirect_to suppliers_path, :notice => notice
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    supplier = Supplier.find(params[:id])

    if supplier.update_attributes(supplier_params)
      notice = "Supplier berhasil di update."
    else
      notice = "Supplier gagal di update. Hubungi administrator."
    end
    redirect_to suppliers_path, :notice => notice
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :phone)
  end
end

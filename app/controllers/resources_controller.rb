class ResourcesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create    
    resource = Resource.new(resource_params)

    if resource.save
      notice = "Resource berhasil di buat."
    else
      notice = "Resource gagal di buat. Hubungi administrator."
    end
    redirect_to resources_path, :notice => notice
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    resource = Resource.find(params[:id])

    if resource.update_attributes(resource_params)
      notice = "Resource berhasil di update."
    else
      notice = "Resource gagal di update. Hubungi administrator."
    end
    redirect_to resources_path, :notice => notice
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :quantity)
  end
end

class ResourcesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @resource = Resource.new
    @resources = Resource.all
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


  private

  def resource_params
    params.require(:resource).permit(:name, :quantity)
  end
end

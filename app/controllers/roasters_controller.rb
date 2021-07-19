class RoastersController < ApplicationController

  def index
   roasters =  Roaster.all
   render json: {status: 200, roaster: roasters}
  end

  def show 
    roaster = Roaster.find(params[:id])
    render json: {status: 200, roaster: roaster}
  end

  def update
    roaster = Roaster.find(params[:id])
    roaster.update(roaster_params)
    render(json: {roaster: roaster})
  end

  def destroy
    roaster = Roaster.destroy(params[:id])
    render(status: 204)
  end

  private # Any methods below here

  def roaster_params
    # Returns a sanitized hash of the params with nothing extra
    params.permit(:name, :email, :img_url, :password_digest, :address, :website,  :phone, :latitude, :longitutde, :description)
  end
end

class RoastersController < ApplicationController

  def index
   roasters =  Roaster.all
   render json: {status: 200, roaster: roasters}
  end

  def show 
    roaster = Roaster.find(params[:id])
    render json: {status: 200, roaster: roaster}
  end
end

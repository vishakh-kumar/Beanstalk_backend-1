class SessionsController < ApplicationController


  def create
    roaster = Roaster
    .find_by(email: params["roaster"]["email"])
    .try(:authenticate, params["roaster"]["password"])

    if roaster 
      session[:roaster_id] = roaster.id
      render json: {
        status: :created,
        logged_in: true,
        roaster: roaster
      }
    else
      render json: {
        status: 401
      }
    end
  end
end
class SessionsController < ApplicationController
include CurrentRoasterConcern
  def logged_in
    if @current_roaster
      render json: {
        logged_in: true,
        roaster: @current_roaster
      }
    else
      render json: {
        loggin_in: false
      }
    end
  end

  def logout 
    reset_session
    render json: {status: 200, logged_out: true}
  end


  def create
    roaster = Roaster
    .find_by(email: params['roaster']["email"])
    .try(:authenticate, params["roaster"]["password"])

    if roaster 
      session[:roaster_id] = roaster.id
      render json: {
        status: :created,
        logged_in: true,
        roaster: roaster
      }
    else
      render json: {status: 401}
    end
  end
end

=begin
curl --header "Content-Type: application/json" --request POST --data '{"roaster": {"email": "merit@coffee.com", "password": "meritcoffee"}}' http://localhost:3001/sessions
=end


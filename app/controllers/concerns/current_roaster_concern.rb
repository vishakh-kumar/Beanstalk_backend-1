module CurrentRoasterConcern 
extend ActiveSupport::Concern

  included do
    before_action :set_current_roaster
  end

  def set_current_roaster
    if session[:roaster_id]
    @current_roaster = Roaster.find(session[:roaster_id])
    end
  end
end
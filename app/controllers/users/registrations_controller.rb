module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, only: [:create]

    def edit
      raise ActionController::RoutingError.new 'N/A'
    end

    def update
      raise ActionController::RoutingError.new 'N/A'
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(email password name))
    end
  end
end

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # Configures parameters required for devise registration gem
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [user_profile_attributes:[:first_name, :last_name]])
    end
end

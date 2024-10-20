class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def after_sign_in_path_for(resource)
      events_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def trigger_error
      raise StandardError.new("This is a 500 error for testing")
    end
  end
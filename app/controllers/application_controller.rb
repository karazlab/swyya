class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit, on: %i[create update destroy], unless: :devise_controller?

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email personal_photo password password_confirmation current_password])
  end
end

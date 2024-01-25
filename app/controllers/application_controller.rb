# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name line_user_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name line_user_id])
  end
end

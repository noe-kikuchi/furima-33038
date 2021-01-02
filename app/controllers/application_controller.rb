class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configre_permitted_parameters, if: :devise_controller?

  private
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birth_date_id])
  end
end

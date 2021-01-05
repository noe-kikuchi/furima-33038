class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configre_permitted_parameters, if: :devise_controller?

  private

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana,
                                             :birth_date_id])
  end
end

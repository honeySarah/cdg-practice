class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      authenticate_user!
      # redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name])
  end

  def after_sign_out_path_for(resourse_or_scope)
    request.referrer
  end
end

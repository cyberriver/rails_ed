class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :set_current_path
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(current_user)
     admin_tests_path if current_user.is_a?(Admin) || tests_path
  end

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name, :email, :password)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name, :email, :password, :current_password)}
       end

  private

  def set_current_path
    session[:return_link] ||= request.url
  end

end

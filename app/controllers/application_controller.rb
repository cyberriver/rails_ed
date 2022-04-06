class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :set_current_path
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  def after_sign_in_path_for(current_user)
     current_user.admin? ? admin_tests_path : tests_path
  end

  def default_url_options
    { lang: params[:lang] == I18n.default_locale ? nil : params[:lang]}
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

  def set_locale

  #  byebug
    if session[:lang].present?
      locale = session[:lang].to_sym
      I18n.locale = I18n.locale_available?(locale) ? locale : I18n.default_locale
    end

  end


end

class SettingsController < ApplicationController
  skip_before_action :set_locale

  def change_locale
  #  set_locale
    locale = params[:lang].to_sym
    I18n.locale = I18n.locale_available?(locale) ? locale : I18n.default_locale
    session[:lang] = I18n.locale

    redirect_to request.referer || root_url
  end

end

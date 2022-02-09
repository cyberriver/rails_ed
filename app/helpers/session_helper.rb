module SessionHelper

  private

  def save_current_path
    session[:return_to] ||= request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end
end

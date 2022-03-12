class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to session[:return_link] || tests_path, notice: "You have successfully logged in"

    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "You have logout"
  end

end

class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :current_user, only: %i[show edit update]

  def show

  end

  def new
    @current_user=User.new
  end

  def create
    @current_user=User.new(user_params)

    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @current_user.update(user_params)
    if @current_user.save
       redirect_to tests_path
    else
       render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:email,:name, :password, :password_confirmation)
  end

end

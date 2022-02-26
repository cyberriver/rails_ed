class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :set_user, only: %i[show edit update]

  def show

  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.save
       redirect_to tests_path
    else
       render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:email,:name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end

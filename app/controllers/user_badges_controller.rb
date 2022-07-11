class UserBadgesController < ApplicationController

  before_action :set_user

  def index
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

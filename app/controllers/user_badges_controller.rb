class UserBadgesController < ApplicationController

  def index
    @user_badges = current_user.user_badges.all
  end

  def check
    UserBadge.check_for_achivement(obj)
  end

  private


end

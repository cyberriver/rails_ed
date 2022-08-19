class UserBadgesController < ApplicationController

  def index
    @user_badges = current_user.user_badges.all
  end



end

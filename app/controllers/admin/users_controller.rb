class Admin::UsersController < Admin::BaseController
  before_action :set_users, only: %i[index]

  def index

  end

  private

  def set_users
    @users = User.all
  end

end

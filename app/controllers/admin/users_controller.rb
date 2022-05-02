class Admin::UsersController < Admin::BaseController
  before_action :set_users, only: %i[index]

  def index
    @users = User.all
  end

end

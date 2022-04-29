class Admin::GistsController < Admin::BaseController
  before_action :set_gists, only: %i[index]

  def index

  end

  private

  def set_gists
    @gists = Gist.all
  end

end

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges= Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.sucess')
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @badge.update(badge_params)
    if @badge.save
       redirect_to admin_badges_path, notice: t('.sucess')
    else
       render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, status:303
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :file_name )
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end

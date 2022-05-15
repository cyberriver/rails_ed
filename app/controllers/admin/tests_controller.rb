class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.all

  end

  def show

  end

  def new
    @test= current_user.author_tests.new
  end

  def edit

  end

  def update
    @test.update(test_params)
    if @test.save
       redirect_to admin_tests_path
    else
       render :edit, status: :unprocessable_entity
    end
  end

  def create

    @test = current_user.author_tests.new(test_params)
    if @test.save
       redirect_to admin_tests_path, notice: t('.sucess')
    else
       render :new, status: :unprocessable_entity
    end
  end

  def destroy

    @test.destroy
    redirect_to admin_tests_path, status:303
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execute time: #{finish *1000}ms")
  end

  def rescue_with_test_not_found
    render plain: t('shared.errors.not_found')
  end
end

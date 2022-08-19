class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update update_inline destroy start ready]
  before_action :set_tests, only: %i[index update_inline destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found


  def index

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
       redirect_to admin_tests_path, notice: t('.sucess')
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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.sucess')
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy

    @test.destroy
    redirect_to admin_tests_path, status:303

  end

  def ready
    if @test.update(ready: params[:ready])
      redirect_to admin_tests_path, notice: "Тест активирован"
    else
      render :index, status: :unprocessable_entity

    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execute time: #{finish *1000}ms")
  end

  def rescue_with_test_not_found
    redirect_to admin_tests_path, alert: t('shared.errors.not_found')
  end

  def rescue_with_test_has_other_data
    redirect_to admin_tests_path, status: :unprocessable_entity, alert: t('shared.errors.has_connected_data')
  end
end

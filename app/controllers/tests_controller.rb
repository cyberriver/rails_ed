class TestsController < ApplicationController
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
       redirect_to tests_path
    else
       render :edit
    end
  end

  def create

    @test = current_user.author_tests.new(test_params)
    if @test.save
       redirect_to tests_path
    else
       render :new
    end
  end

  def destroy

    @test.destroy
    redirect_to tests_path
  end

  def start

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end


  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id )
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execute tome: #{finish *1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end

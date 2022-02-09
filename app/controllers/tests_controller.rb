class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]
  before_action :find_all_users

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.all
    save_current_path
  end

  def show
    save_current_path
  end

  def new
    @test= Test.new
  end

  def edit

  end

  def update
    @test.update(test_params)
    if @test.save
       redirect_to tests_path
    else
       render plain: 'что-то пошло не так в момент сохранения'
    end



  end

  def create
    @test = Test.new(test_params)
    if @test.save
       redirect_to tests_path
    else
       render plain: 'что-то пошло не так в момент сохранения'
    end



  end

  def destroy

    @test.destroy
    redirect_to tests_path
  end


  private


  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id )
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_all_users
    @user = User.all
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

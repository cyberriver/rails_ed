class TestsController < ApplicationController
  before_action :find_test, only: %i[show show edit update destroy]
  before_action :find_all_users
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.all
    #render json: {tests: @test}
  end

  def show
    render json: {question: @test}

  end

  def new
    @form_auth_token = form_authenticity_token
  end

  def edit

  end

  def update
    @test.assign_attributes(test_params)
    @test.save
    redirect_to tests_path
  end

  def create
    @test = Test.create(test_params)
    redirect_to tests_path
  end

  def destroy

    @test.destroy
    redirect_to tests_path
  end


  private

  def test_params
    params.require(:test).permit([:title, :level, :category_id, :author_id] )
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_all_users
    @user = User.all
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
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

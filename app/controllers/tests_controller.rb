class TestsController < ApplicationController
  before_action :set_test, only: %i[start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.all

  end

  def start

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end


  private

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

class TestsController < ApplicationController
  before_action :set_test, only: %i[start]
  before_action :find_tests, only: %i[index]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  end

  def start

    if @test.has_questions?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, alert: t('shared.errors.no_questions')
    end
  end


  private

  def set_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all.where(ready:true)
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execute tome: #{finish *1000}ms")
  end

  def rescue_with_test_not_found
    render plain: t('.not_found')
  end
end

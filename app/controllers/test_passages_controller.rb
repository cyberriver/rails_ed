class TestPassagesController < ApplicationController

  before_action :set_test_pessage, only: %i[show update result]

  def show
    logger.info("LOG [#{params}] ")
    logger.info("LOG [#{@test_pessage}] title #{@test_pessage.test.title} current_question #{@test_pessage.current_question}")

  end

  def result

  end

  def update

  end

  private

  def set_test_pessage
    @test_pessage = TestPassage.find(params[:id])

  end

end

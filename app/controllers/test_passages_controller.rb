class TestPassagesController < ApplicationController
  before_action :set_user
  before_action :set_test_pessage, only: %i[show update result]

  def index

  end

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_test_pessage
    @test_passage = TestPassage.find(params[:id])

  end

end

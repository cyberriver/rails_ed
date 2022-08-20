class TestPassagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[update]
  before_action :set_test_pessage, only: %i[show update result gist]

  def index
  end

  def show
  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.time_out?
      # все проверки запускаются только в случае, если тест выполнен успешно
      if @test_passage.test_result_check
        badges_count = current_user.badges.size
        CheckAchivementsService.new(@test_passage, current_user).call
        flash[:notice] = t('got_achivement') if current_user.badges.size > badges_count
      end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end


  private

  def set_test_pessage
    @test_passage = TestPassage.find(params[:id])

  end



end

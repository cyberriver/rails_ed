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
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    conn = GistQuestionService.new(@test_passage.current_question)
    conn.call

    if conn.response.status.in?(200..299)
        flash_options = {notice: t('success_gist_question', url: conn.response.data.url)}
        gist_save(@test_passage.current_question,
                  conn.response.data.url,
                  @test_passage.user.email)

    else
      flash_options = {alert: t('failure_gist_question')}
    end

    redirect_to test_passage_path(@test_passage), flash_options
  end


  private

  def set_test_pessage
    @test_passage = TestPassage.find(params[:id])

  end

  def gist_save(question,url,email)
    @gist = question.gists.new(
            gist_url: url,
            email: email )
    @gist.save

  end


end

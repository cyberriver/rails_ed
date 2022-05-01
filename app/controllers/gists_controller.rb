class GistsController < ApplicationController
  before_action :set_test_pessage, only: %i[create index]

  def create
    conn = GistQuestionService.new(@test_passage.current_question)
    conn.call

    if conn.success?
      flash_options = {notice: t('success_gist_question', url: conn.response.data.url)}
      gist_save(@test_passage.current_question,
                      conn.response.data.html_url,
                      @test_passage.user.id)
    else
      flash_options = {alert: t('failure_gist_question')}

    end

    redirect_to test_passage_path(@test_passage), flash_options
  end

  def index

  end

  private

  def set_test_pessage
    @test_passage = TestPassage.find(params[:test_passage_id])

  end

  def gist_save(question,url,user)
    @gist = question.gists.new(
            gist_url: url,
            user_id: user)
    @gist.save!

  end


end

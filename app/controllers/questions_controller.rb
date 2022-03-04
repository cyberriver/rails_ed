class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test, only: %i[new create]


  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit

  end

  def update
    @question.update(question_params)
    if @question.save
       redirect_to test_path(@question.test_id)
    else
       render :edit
    end

  end

  def create
      @question = @test.questions.new(question_params)
    if @question.save
       redirect_to test_path(@question.test_id)
    else
       render :new
    end

  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test_id)
  end



  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])

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

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end

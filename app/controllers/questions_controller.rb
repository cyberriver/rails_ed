class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @question = Question.where(test_id: params[:test_id])
    session[:test_id] = params[:test_id]
  end

  def show
    render json: {question: @question}

  end

  def new
    @form_auth_token = form_authenticity_token
  end

  def edit

  end

  def update
    @question.update(question_params)
    redirect_to test_questions_path(session[:test_id])
  end

  def create
    logger.info("test data #{question_params}")
    @question = Question.create(question_params)
    redirect_to test_questions_path(session[:test_id])
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(session[:test_id])
  def find_test
    @test = Test.find(params[:id])
  end  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
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

class QuestionsController < ApplicationController
  def index
    @question = Question.all
    #render json: {questions: Question.all}
  end

  def show
    @question = Question.find(params[:id])
    render json: {question: @question}

  end

  def new
    @form_auth_token = form_authenticity_token
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update!(body: params[:question][:body])
    redirect_to questions_path
  end

  def create
    @question = Question.create(question_params)
    redirect_to questions_path
  end

  def destroy
    
    @question= Question.find(params[:question_id])
    @question.destroy!
    redirect_to questions_path
  end

  private

  def question_params
    params.permit(:body, :test_id)
  end

end

class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test, only: %i[new create]
  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  #def index
  #end

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
       redirect_to admin_test_path(@question.test_id)
    else
       render :edit, status: :unprocessable_entity
    end

  end

  def create
      @question = @test.questions.new(question_params)
    if @question.save
       redirect_to admin_test_path(@question.test_id), notice: t('.sucess')
    else
       render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id), status:303
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

  def rescue_with_question_not_found
    render plain: t('shared.errors.not_found')
  end

end

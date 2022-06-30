class AnswersController < ApplicationController
  before_action :find_question, only: %i[ new create ]
  before_action :set_answer, only: %i[ show edit update destroy ]


  def show

  end


  private

    def find_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:title,:correct)
    end
end

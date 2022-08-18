class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test

  belongs_to :current_question, class_name: :Question, optional: true
  before_validation :before_validation_set_question, on: [:create, :update]
  TEST_SCORE_LIMIT = 0.85  #parameter for success score result


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question +=1
    end
    save!
  end

  def current_question_position
    self.test.questions.order(id: :desc).where('id < ?',self.current_question_id).count+1
  end

  def current_progress
    if self.completed?
      100
    else
      (current_question_position.to_f / test.questions.count) * 100.round(1)
    end
  end

  def test_result_check
    if self.test_result > TEST_SCORE_LIMIT
      true
    else
      false
    end
  end

  def test_result
    self.correct_question.to_f / self.test.questions.count.to_f.round(2)
  end


  private

  def before_validation_set_question
    if self.current_question.present?
      self.current_question = next_question
    else
      set_first_question
    end
  end

  def set_first_question
    self.current_question = test.questions.first if test.present?

  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first

  end

end

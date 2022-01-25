class Answer < ApplicationRecord
  belongs_to :question
  validates :title, presence:true
  validate :answers_count_check?

  scope :correct_answers, ->{where(correct:true)}

  private
  def answers_count_check?
    errors.add(:title) if Answer.where(question_id:question_id).count==4
  end
end

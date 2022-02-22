class Answer < ApplicationRecord
  belongs_to :question
  validates :title, presence:true
  validate :answers_count_check?, on: [:create, :update]

  scope :correct, ->{where(correct:true)}

  private
  def answers_count_check?
    errors.add(:title) if question.answers.count > 4
  end
end

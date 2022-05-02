class Question < ApplicationRecord
  has_many :answers
  has_many :current_question, class_name: :TestPassage, foreign_key: :current_question_id
  has_many :gists
  belongs_to :test

  validates :body, presence:true


end

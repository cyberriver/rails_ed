class Question < ApplicationRecord
  has_many :answers
  validates :body, presence:true

end

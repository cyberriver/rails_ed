class User < ApplicationRecord
  require 'uri'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: :Test, foreign_key: :author_id
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :show_tests, -> (level,user_id) do
    joins(:users_tests, :tests)
    .where(users_tests: {user_id: user_id}, tests: {level: level})
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end


end

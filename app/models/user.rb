class User < ApplicationRecord
  require 'uri'
  #EMAIL_REGEX =/.+@.+\..+/i
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :author_tests, class_name: :Test, foreign_key: :author_id
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :show_tests, -> (level,user_id) do
    joins(:users_tests, :tests)
    .where(users_tests: {user_id: user_id}, tests: {level: level})
  end

end

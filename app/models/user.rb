class User < ApplicationRecord
  EMAIL_REGEX =/.+@.+\..+/i
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :author_tests, class_name: :Test, foreign_key: :author_id
  validates :name, presence: true

  scope :show_tests, -> (level) do
    joins(:users_tests, :tests)
    .where(tests: {level: level})
  end

  validate :valid_email?

  private

  def valid_email?
    errors.add(:email) unless email=~EMAIL_REGEX
  end

end

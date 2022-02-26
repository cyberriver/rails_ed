require 'uri'
require 'digest/sha1'

class User < ApplicationRecord

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: :Test, foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email, message: "such email is already busy"

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end


end

require 'uri'


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: :Test, foreign_key: :author_id

  validates :first_name, presence: true
  validates :email, uniqueness: {message: "such email is already busy"} , format: { with: URI::MailTo::EMAIL_REGEXP }


  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end


end

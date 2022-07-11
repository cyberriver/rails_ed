class Badge < ApplicationRecord
  has_many :users, through: :user_badges, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  scope :sort_by_asc, ->{order(title: :asc)}

end

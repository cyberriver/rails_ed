class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  scope :sort_by_asc, ->{order(title: :asc)}
  has_one_attached :image

  def resized_small
    image.variant(resize: '100x100')
  end

  def resized_very_small
    image.variant(resize: '50x50')
  end
end

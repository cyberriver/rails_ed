class Category < ApplicationRecord
  has_many :tests
  scope :sort_by_asc, ->{order(title: :asc)}

end

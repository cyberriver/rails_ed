class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :users_tests
  has_many :users, through: :users_tests

  def self.by_category(category_name)
    joins('JOINS categories on category_id=category.id')
    .where('categories.title=:category_name', category_name:category_name)
    .order(title: :desc)
    .pluck(:title)

  end
end

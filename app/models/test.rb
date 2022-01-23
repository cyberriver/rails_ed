class Test < ApplicationRecord

  def self.by_category(category_name)
    joins('JOINS categories on category_id=category.id')
    .where('categories.title=:category_name', category_name:category_name)
    .order(title: :desc)
    .pluck(:title)

  end
end

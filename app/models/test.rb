class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions

  validates :title, presence: true,
    uniqueness: {scope: :level}
  validates :level, presence: true, numericality: {only_interger: true, greater_than: 0}


  scope :easy, ->{where(level:0..1)}
  scope :medium, ->{where(level:2..4)}
  scope :hard, ->{where(level:5..Float::INFINITY)}

  scope :show_tests_by_category, ->(category_name) do
    joins(:category)
    .where(categories: {title: category_name})
  end

  def self.show_title(category_name)
    self.show_tests_by_category(category_name)
    .order(title: :desc)
    .pluck(:title)

  end

end

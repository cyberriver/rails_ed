# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.disable_referential_integrity do
  begin
    Test.find_or_create_by(title: 'Rails tests seed') do |test|
      test.level = 1
      test.category_id = 1
    end

    Answer.find_or_create_by(title: 'Correct Answer 1') do |answer|
      answer.correct = 1
      answer.question_id = 1
    end

    Answer.find_or_create_by(title: 'Incorrect Answer 2') do |answer|
      answer.correct = 0
      answer.question_id = 1
    end

    Question.find_or_create_by(body: 'Pls choose Correct Answer?',test_id: 1 )

    Category.find_or_create_by(title: 'Junior Web development tests')

    User.find_or_create_by(name: 'John Doe') do |users|
      users.email = 'test@test.com'
    end
  rescue ActiveRecord::RecordNotUnique
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.disable_referential_integrity do
  begin
    category = Category.find_or_create_by(title: 'Junior Web development tests')
    user = User.new(
      first_name: 'John',
      last_name:  'Doe',
      email: 'test@test.com',
      type: 'Admin',
      password: "123456",
      password_confirmation: "123456")

    user.skip_confirmation!
    user.save!

    test = Test.find_or_create_by(title: 'Rails tests seed', level:1, category_id: category.id, author_id: user.id,ready:true)
    question = Question.find_or_create_by(body: 'Pls choose seed Correct Answer?',test_id: test.id)
    Answer.find_or_create_by(title: 'Correct seed Answer 1', correct: true, question_id: question.id)
    Answer.find_or_create_by(title: 'Incorrect seed Answer 2', correct: false, question_id: question.id)
    TestPassage.find_or_create_by(user_id: user.id, test_id: test.id, current_question_id: question.id)
    # badges creation
    Badge.find_or_create_by(title: "Попал с 1го раза", file_name: "first_attempt.svg", rule: "got_the_test_by_one_time", parameter: "")
    Badge.find_or_create_by(title: "Ветеран тестов", file_name: "tests_lover.svg", rule: "check_count_testpassage", parameter: "5")
    Badge.find_or_create_by(title: "Сделал все в одной категории!", file_name: "one_category.svg", rule: "check_count_by_category?", parameter: category.title)

  rescue ActiveRecord::RecordNotUnique
  end
end

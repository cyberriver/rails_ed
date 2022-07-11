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
    answer_correct = Answer.find_or_create_by(title: 'Correct seed Answer 1', correct: true, question_id: question.id)
    answer_incorrect = Answer.find_or_create_by(title: 'Incorrect seed Answer 2', correct: false, question_id: question.id)

    TestPassage.find_or_create_by(user_id: user.id, test_id: test.id, current_question_id: question.id)

  rescue ActiveRecord::RecordNotUnique
  end
end

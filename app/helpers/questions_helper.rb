module QuestionsHelper

  def question_header(question)

    if question.new_record?
      "<h1>Create New #{question.test.title} Question</h1>".html_safe
    else
        "<h1>Edit #{question.test.title} Question</h1>".html_safe
      end
  end
end

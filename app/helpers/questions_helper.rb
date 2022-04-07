module QuestionsHelper

  def question_header(question)
    html = ""
    if question.new_record?
      html << "<h1>"
      html << t('helpers.question.new', title:question.test.title)
      html << "</h1>"
      html.html_safe
    else
      html << "<h1>"
      html << t('helpers.question.edit', title:question.test.title)
      html << "</h1>"
      html.html_safe

    end
  end
end

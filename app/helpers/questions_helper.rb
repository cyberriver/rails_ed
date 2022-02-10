module QuestionsHelper
  #Для заголовка формы создания и редактирования вопроса.
  #Это должен быть один метод question_header который в форме создания вопроса будет выводить
  #Create New <Test Title> Question, а в форме редактирования Edit <Test Title> Question
  def question_header(question)
    out = ''
    out << "<h1>Create New #{question.test.title} Question</h1>" if question.new_record?
    out << "<h1>Edit #{question.test.title} Question</h1>"if question.persisted?
    out.html_safe
  end
end

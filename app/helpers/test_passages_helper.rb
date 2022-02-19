module TestPassagesHelper

  def show_result(test_passage)
    result = test_result(test_passage)
    if result > 0.85
      "<h3 style='color: green;' >You have success passed the test. Your score is #{result*100}%</h3>".html_safe
    else
      "<h3 style='color: red;' >You have failed the test. Your score is #{result*100}%</h3>".html_safe
    end
  end


  private

  def test_result(test_passage)
    (test_passage.correct_question.to_f / test_passage.test.questions.count.to_f).round(2)
  end

end

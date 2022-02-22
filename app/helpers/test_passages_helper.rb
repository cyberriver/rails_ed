module TestPassagesHelper

  def show_result(test_passage)
    if test_passage.test_result > 0.85
      "<h3 style='color: green;' >You have success passed the test. Your score is #{test_passage.test_result*100}%</h3>".html_safe
    else
      "<h3 style='color: red;' >You have failed the test. Your score is #{test_passage.test_result*100}%</h3>".html_safe
    end
  end

end

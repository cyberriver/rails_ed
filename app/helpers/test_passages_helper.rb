module TestPassagesHelper

  def show_result(test_passage)
    html = ""
    if test_passage.test_result_check
      html << t('.header.passed', title: @test_passage.test.title)
      html << "<h3 style='color: green;' >"
      html << t('helpers.score.passed')
      html << "#{test_passage.test_result*100}%</h3>"
      html.html_safe
    else
      html << t('.header.failed', title: @test_passage.test.title)
      html << "<h3 style='color: red;' >"
      html << t('helpers.score.failed')
      html << "#{test_passage.test_result*100}%</h3>"
      html.html_safe
    end
  end

end

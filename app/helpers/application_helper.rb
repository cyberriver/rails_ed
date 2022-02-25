module ApplicationHelper
  def footer_year_data
    Time.current.year
  end

  def github_url
    link_to "Сервис TestGuru", "https://github.com/#{Rails.configuration.author_app}/#{Rails.configuration.repo_app}", :target => "_blank"
  end

  def flash_message!
    flash.map do |key,msg|
      content_tag :p, msg, :id => key, class: "flash #{key}"
    end.join.html_safe
  end
end

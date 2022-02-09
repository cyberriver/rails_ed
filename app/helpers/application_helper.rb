module ApplicationHelper
  def footer_year_data
    Time.current.year
  end

  def github_url(author,repo)
    out = "https://github.com/#{author}/#{repo}"
  end

end

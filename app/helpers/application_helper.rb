module ApplicationHelper
  def footer_year_data
    Time.current.year
  end

  def github_url
    link_to t('project_info'), "https://github.com/#{Rails.configuration.author_app}/#{Rails.configuration.repo_app}", :target => "_blank"
  end

  def flash_message!
    flash.map do |key,msg|
      if key && msg
        content_tag(:div, msg, id: key, class: "#{flash_class(key)}")
      end
    end.join.html_safe
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def icon(filename, options = {})

    assets = Rails.application.assets
    asset = assets.find_asset(filename)

    if asset
      file = asset.source.force_encoding("UTF-8")
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css "svg"
      svg["class"] = options[:class] if options[:class].present?
    else
      doc = "<!-- SVG #{filename} not found -->"
    end

    raw doc
  end


end

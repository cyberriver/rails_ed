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
        content_tag :div, msg, :id => key, class: "flash #{key}"
      end
    end.join.html_safe
  end

  def set_err_flash(resource)
    resource.errors.full_messages.each do |message|
       flash.now[:alert]||=[]
       flash.now[:alert] << message
     end
  end

  def icon(filename, options = {})
    #byebug
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

require_relative "boot"
require "rails/all"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.load_defaults 7.0
    config.time_zone = 'Moscow'
    config.i18n.default_locale=:ru
    config.author_app = 'cyberriver'
    config.repo_app = 'rails_ed'


#    initializer(:remove_action_mailbox_and_activestorage_routes, after: :add_routing_paths) { |app|
#      app.routes_reloader.paths.delete_if {|path| path =~ /activestorage/}
#      app.routes_reloader.paths.delete_if {|path| path =~ /actionmailbox/ }
#    }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")


  end
end

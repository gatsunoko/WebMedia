require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebMedia
  class Application < Rails::Application
    config.generators{ |g| g.assets false}
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    #CKEditor
    default_tags = Loofah::HTML5::WhiteList::ALLOWED_CSS_PROPERTIES.add('position').add('padding-bottom').add('max-height').add('max-width').add('left').add('top') 
    config.action_view.sanitized_allowed_attributes = ['href', 'src', 'alt', 'data-oembed-url', 'style', 'allowfullscreen', 'frameborder', 'tabindex', 'id', 'text', 'class', 'data-iframely-url'] 
  end
end

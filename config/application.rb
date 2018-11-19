require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Publications
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    mail_credentials = Rails.application.credentials[:mailer]
    config.action_mailer.default_url_options = { host: mail_credentials[:MAILER_DEF_HOST] }
    config.action_mailer.perform_deliveries = true
    config.active_job.queue_adapter = :delayed_job
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    address: "smtp.yandex.com",
    port: 465,
    domain: "yandex.ru",
    authentication: "plain",
    user_name: mail_credentials[:MAIL_USERNAME],
    password: mail_credentials[:MAIL_PASSWORD],
    ssl: true,
    tls: true
}
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

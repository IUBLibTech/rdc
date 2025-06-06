require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DataCatalog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.active_job.queue_adapter = ENV.fetch('HYRAX_ACTIVE_JOB_QUEUE') { 'async' }.to_sym

    config.autoload_paths += [Rails.root.join('lib')]
    config.eager_load_paths += [Rails.root.join('lib')]
    # https://bibwild.wordpress.com/2016/12/27/a-class_eval-monkey-patching-pattern-with-prepend/
    config.to_prepare do
      # Load any monkey-patching extensions in to_prepare for Rails dev-mode class-reloading.
      Dir.glob(File.join(File.dirname(__FILE__), "../lib/extensions/extensions.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.force_ssl = true

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

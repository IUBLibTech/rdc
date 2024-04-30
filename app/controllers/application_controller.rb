class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  include Hydra::Controller::ControllerBehavior

  # Adds Hyrax behaviors into the application controller
  include Hyrax::Controller
  include Hyrax::ThemedLayoutController
  with_themed_layout '1_column'

  # Fixes engine route helpers (e.g. hyrax.about_path) ignoring relative_url_root path prefix
  def url_options
    options = super
    script_name = [Rails.application.config.relative_url_root, options[:script_name]].join('')
    options.merge(script_name: script_name)
  end
end

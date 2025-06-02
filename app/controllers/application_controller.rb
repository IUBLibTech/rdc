class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  include Hydra::Controller::ControllerBehavior

  # Adds Hyrax behaviors into the application controller
  include Hyrax::Controller
  include Hyrax::ThemedLayoutController
  with_themed_layout '1_column'

  def login
    redirect_post('/users/auth/cas', options: {authenticity_token: :auto})
  end

  before_action :set_locale

  def set_locale
    if params[:locale].present?
      I18n.locale = constrained_locale || I18n.default_locale
      params[:locale] = I18n.locale.to_s
    end
  end

  def constrained_locale
    return params[:locale] if params[:locale].in?(Object.new.extend(HyraxHelper).available_translations)
  end
end

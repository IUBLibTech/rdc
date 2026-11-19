module Extensions
  module Hyrax::Breadcrumbs
    module RefererFix

      # Modified to avoid colliding with server hostnames that contain "catalog"
      def trail_from_referer
        case Addressable::URI.parse(request.referer).path
        when /catalog/
          add_breadcrumb I18n.t('hyrax.controls.home'), hyrax.root_path
          add_breadcrumb I18n.t('hyrax.bread_crumb.search_results'), request.referer
        else
          default_trail
          add_breadcrumb_for_controller if user_signed_in?
          add_breadcrumb_for_action
        end
      end

    end
  end
end
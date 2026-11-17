module Extensions
  module Hyrax::Breadcrumbs
    module RefererFix

      def trail_from_referer
        case request.referer
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
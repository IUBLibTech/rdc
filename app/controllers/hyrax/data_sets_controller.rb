# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work_resource DataSet`
module Hyrax
  # Generated controller for DataSet
  class DataSetsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::DataSet

    # Use a Valkyrie aware form service to generate Valkyrie::ChangeSet style
    # forms.
    self.work_form_service = Hyrax::FormFactory.new

    self.show_presenter = Hyrax::DataSetPresenter
  end
end

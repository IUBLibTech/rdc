# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work_resource DataSet`
#
# @see https://github.com/samvera/hyrax/wiki/Hyrax-Valkyrie-Usage-Guide#forms
# @see https://github.com/samvera/valkyrie/wiki/ChangeSets-and-Dirty-Tracking
class DataSetForm < Hyrax::Forms::PcdmObjectForm(DataSet)
  # include Hyrax::FormFields(:basic_metadata)
  include Hyrax::FormFields(:data_set)

  # Define custom form fields using the Valkyrie::ChangeSet interface
  #
  # property :my_custom_form_field

  # if you want a field in the form, but it doesn't have a directly corresponding
  # model attribute, make it virtual
  #
  # property :user_input_not_destined_for_the_model, virtual: true

  # reposition :description, otherwise retain field order
  def primary_terms
    ordered_terms = super.dup
    if ordered_terms.include?(:description)
      ordered_terms.delete(:description)
      ordered_terms.insert(2, :description)
    end
    ordered_terms
  end
end

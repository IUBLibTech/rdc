# extensions.rb - loads monkeypatches for samvera libraries

Rails.application.config.to_prepare do
  # search with wildcard after first 2 characters
  Qa::Authorities::Collections.prepend Extensions::Qa::Authorities::Collections::CollectionsSearch
  Qa::Authorities::FindWorks.prepend Extensions::Qa::Authorities::FindWorks::WorksSearch
  Hyrax::MenuPresenter.prepend Extensions::Hyrax::MenuPresenter::MenuPresenterBehavior
end

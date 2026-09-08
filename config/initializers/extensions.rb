# extensions.rb - loads monkeypatches for samvera libraries

Rails.application.config.to_prepare do
  # search with wildcard after first 2 characters
  Qa::Authorities::Collections.prepend Extensions::Qa::Authorities::Collections::CollectionsSearch
  Qa::Authorities::FindWorks.prepend Extensions::Qa::Authorities::FindWorks::WorksSearch
  Hyrax::MenuPresenter.prepend Extensions::Hyrax::MenuPresenter::MenuPresenterBehavior
  Hyrax::SolrQueryService.prepend Extensions::Hyrax::SolrQueryService
  # return false for render_bookmarks_control?
  CatalogController.prepend Extensions::CatalogController::RenderBookmarksControl
  Hyrax::CollectionsController.prepend Extensions::CatalogController::RenderBookmarksControl
  Hyrax::My::CollectionsController.prepend Extensions::CatalogController::RenderBookmarksControl
  # block creation, querying of blacklight Search records
  CatalogController.prepend Extensions::CatalogController::BlockFindSearchSession
  Hyrax::Dashboard::WorksController.prepend Extensions::CatalogController::BlockFindSearchSession
  Hyrax::Dashboard::CollectionsController.prepend Extensions::CatalogController::BlockFindSearchSession
  Hyrax::My::WorksController.prepend Extensions::CatalogController::BlockFindSearchSession
  Hyrax::My::CollectionsController.prepend Extensions::CatalogController::BlockFindSearchSession
end

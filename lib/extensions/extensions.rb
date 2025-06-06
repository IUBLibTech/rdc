# extensions.rb - loads monkeypatches for samvera libraries

# search with wildcard after first 2 characters
Qa::Authorities::Collections.prepend Extensions::Qa::Authorities::Collections::CollectionsSearch
Qa::Authorities::FindWorks.prepend Extensions::Qa::Authorities::FindWorks::WorksSearch

FactoryBot.define do
  factory :collection, class: Hyrax.config.collection_class do
    sequence(:title) { |n| "Test Collection #{n}" }
  end
end
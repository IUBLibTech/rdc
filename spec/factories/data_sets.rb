FactoryBot.define do
  factory :data_set do
    sequence(:title) { |n| "Test Data Set #{n}" }
  end
end
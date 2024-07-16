FactoryBot.define do
  factory :video do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:external_id) { |n| "external_id-#{n}" }
  end
end

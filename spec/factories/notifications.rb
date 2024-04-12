FactoryBot.define do
  factory :notification do
    association :user
    association :video
  end
end
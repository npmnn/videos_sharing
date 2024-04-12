FactoryBot.define do
  factory :video do
    user { FactoryBot.create(:user) }
    link { "https://www.youtube.com/watch?v=#12345678901" }
  end
end
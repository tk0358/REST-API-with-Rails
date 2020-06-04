FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "ruru#{n}" }
    name { "Ruru Kaseda" }
    url { "http://example.com" }
    avatar_url { "http://example.com/avatar" }
    provider { "github" }
  end
end

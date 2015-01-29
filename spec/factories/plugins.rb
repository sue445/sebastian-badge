FactoryGirl.define do
  factory :plugin do
    name        { Faker::Precure.user_name }
    title       { Faker::Precure.title }
    version     { "0.0.1" }
    wiki_url    { "http://#{Faker::Precure.user_name}.com" }
    released_at { Time.current }
  end
end

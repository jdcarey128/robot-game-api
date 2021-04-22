FactoryBot.define do 
  factory :user do 
    name { Faker::Internet.username }
    score { rand(0..100) }
    created_at { DateTime.now }
  end
end

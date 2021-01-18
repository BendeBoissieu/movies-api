FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    plot { Faker::Lorem.paragraph }
  end
end

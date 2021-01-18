season_nb = 0
FactoryBot.define do
  factory :season do
    title { Faker::Movie.title }
    plot { Faker::Lorem.paragraph }
    season_nb { season_nb += 1}
  end
end

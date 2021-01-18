episode_nb = 0
FactoryBot.define do
  factory :episode do
    episode_nb += 1
    title { "ep#{episode_nb}"}
    plot { "plot episode#{episode_nb}"}
    season_nb { 1 }
  end
end

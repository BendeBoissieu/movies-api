require 'Faker'

10.times { Movie.create(title: Faker::Movie.title, plot: Faker::Lorem.paragraph) }
5.times { Season.create(title: Faker::Movie.title, plot: Faker::Lorem.paragraph) }
Season.all.each do |season|
  3.times {Episode.create(title: Faker::Books::CultureSeries.book, plot: Faker::Lorem.paragraph, season_id: season.id)}
end



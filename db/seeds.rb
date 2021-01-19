require 'Faker'

Movie.destroy_all
Season.destroy_all
User.destroy_all

10.times { Movie.create(title: Faker::Movie.title, plot: Faker::Lorem.paragraph) }
5.times { Season.create(title: Faker::Movie.title, plot: Faker::Lorem.paragraph) }
Season.all.each do |season|
  rand(3..15).times {Episode.create(title: Faker::Books::CultureSeries.book, plot: Faker::Lorem.paragraph, season_id: season.id)}
  PurchaseOption.create(price: 8.00, video_quality: "SD", season_id: season.id)
  PurchaseOption.create(price: 16.50, video_quality: "HD", season_id: season.id)
end

Movie.all.each do |movie|
  PurchaseOption.create(price: 10.00, video_quality: "SD", movie_id: movie.id)
  PurchaseOption.create(price: 20.50, video_quality: "HD", movie_id: movie.id)
end

user = User.create(email: "user1@test.com")
movie = Movie.first
Purchase.create(user_id: user.id, content: "Movie", movie_id: movie.id, purchase_option_id: movie.purchase_options.first.id)

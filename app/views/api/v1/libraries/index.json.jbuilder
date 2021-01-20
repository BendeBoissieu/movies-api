json.movies @movies do |movie|
  json.extract! movie, :id, :title, :plot
  json.purchase_options movie.purchase_options, :id, :price, :video_quality
end
json.seasons @seasons do |season|
  json.extract! season, :id, :title, :plot, :season_nb
  json.purchase_options season.purchase_options, :id, :price, :video_quality
end

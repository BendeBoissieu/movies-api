json.movies @movies do |movie|
  json.extract! movie, :title
end
json.seasons @seasons do |season|
  json.extract! season, :title, :season_nb
end

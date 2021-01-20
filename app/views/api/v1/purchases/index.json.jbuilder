json.movies @movies do |movie|
  json.extract! movie, :id, :title
end
json.seasons @seasons do |season|
  json.extract! season, :id, :title, :season_nb
end

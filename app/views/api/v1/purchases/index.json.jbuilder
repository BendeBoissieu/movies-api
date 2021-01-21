json.movies @movies do |movie|
  json.extract! movie, :id, :title, :created_at
end
json.seasons @seasons do |season|
  json.extract! season, :id, :title, :season_nb, :created_at
end

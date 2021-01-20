json.array! @seasons do |season|
  json.extract! season, :id, :title, :plot
  json.episodes season.episodes do |episode|
    json.extract! episode, :id, :title, :plot, :season_id
  end
end


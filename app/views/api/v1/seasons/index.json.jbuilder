json.array! @seasons do |season|
  json.extract! season, :title, :plot
  json.episodes season.episodes do |episode|
    json.extract! episode, :title, :plot, :season_id
  end
end


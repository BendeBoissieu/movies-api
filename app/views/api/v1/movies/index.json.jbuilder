json.array! @movies do |movie|
  json.extract! movie, :title, :plot
end

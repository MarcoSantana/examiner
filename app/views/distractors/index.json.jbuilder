json.array!(@distractors) do |distractor|
  json.extract! distractor, :id
  json.url distractor_url(distractor, format: :json)
end

json.array!(@subjects) do |subject|
  json.extract! subject, :id, :content
  json.url subject_url(subject, format: :json)
end

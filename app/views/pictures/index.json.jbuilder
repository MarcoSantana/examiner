json.array!(@pictures) do |picture|
  json.extract! picture, :id, :user_id, :question_id, :size, :format, :additional_code, :description, :in_line
  json.url picture_url(picture, format: :json)
end

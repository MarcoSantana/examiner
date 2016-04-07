json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_id, :question_id, :quiz_id, :answer, :pending
  json.url answer_url(answer, format: :json)
end

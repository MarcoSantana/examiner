class QuestionSetsQuiz < ActiveRecord::Base

	belongs_to :quiz
	belongs_to :question_set
end

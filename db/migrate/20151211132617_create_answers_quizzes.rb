class CreateAnswersQuizzes < ActiveRecord::Migration
  def change
    create_table :answers_quizzes do |t|
		t.integer "answer_id", limit: 4, null: false
		t.integer "quiz_id",         limit: 4, null: false

      t.timestamps null: false
    end
	
	#Añadimos índice entre quiz y answer
	add_index "answers_quizzes", ["answer_id", "quiz_id"], name: "index_answers_quizzes_on_answer_id_and_quiz_id", using: :btree

	add_index "answers_quizzes", ["quiz_id", "answer_id"], name: "index_answers_quizzes_on_quiz_id_and_answer_id", using: :btree

  end
end

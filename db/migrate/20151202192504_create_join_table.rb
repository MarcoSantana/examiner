class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :question_sets, :quizzes do |t|
      t.index [:question_set_id, :quiz_id]
      t.index [:quiz_id, :question_set_id]
    end
  end
end

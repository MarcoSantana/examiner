class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :quiz, index: true, foreign_key: true
      t.string :answer, limit: 1
      t.boolean :pending

      t.timestamps null: false
    end
  end
end

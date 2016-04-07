class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.date :application_date
      t.decimal :difficulty, precision: 5, scale: 4, :default => 0.0000
      t.boolean :visible, :default => true
      t.boolean :locked, :default => false
      t.text :description

      t.timestamps
    end
  end
end

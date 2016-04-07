class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.references :subject
      t.references :user
      t.decimal :difficulty, precision: 5, scale: 4, :default => 0.0000
      t.boolean :visible, :default => true
      t.boolean :locked, :default => false
      t.integer :position
      t.text :content
      

      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.references :question_set, index: true, foreign_key: true
    	t.decimal :difficulty, precision: 5, scale: 4, :default => 0.0000
		t.boolean :visible, :default => true
		t.boolean :locked, :default => false
		t.integer :position
		t.text :content

      t.timestamps
    end
  end
end

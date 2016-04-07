class CreateDistractors < ActiveRecord::Migration
  def change
    create_table :distractors do |t|
      t.references :question, index: true, foreign_key: true
      t.string :option, limit: 1
      t.integer :position, limit: 3
      t.decimal :difficulty, precision: 5, scale: 4, :default => 0.0000
      t.boolean :visible, :default => true
      t.boolean :locked, :default => false
      t.text :content
      t.boolean :right, :default => false

      t.timestamps
    end
  end
end

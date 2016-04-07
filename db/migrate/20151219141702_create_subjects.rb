class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end

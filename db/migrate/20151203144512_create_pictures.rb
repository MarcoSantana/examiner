class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :size
      t.string :format
      t.text :additional_code
      t.string :description
      t.boolean :in_line

      t.timestamps null: false
    end
  end
end

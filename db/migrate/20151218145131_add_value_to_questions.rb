class AddValueToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :value, :decimal, :precision => 3, :scale => 2

  end
end

class AddFileNameToPictures < ActiveRecord::Migration
  def up
    add_column :pictures, :file_name, :string
    add_column :pictures, :visible, :boolean, default: false
    add_column :pictures, :locked, :boolean, default: false
  end

  def down
    remove_column :pictures, :file_name, :string
    remove_column :pictures, :visible, :boolean, default: false
    remove_column :pictures, :locked, :boolean, default: false
  end
end

class AddTeacherfieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :text
    add_column :users, :language, :string
  end
end

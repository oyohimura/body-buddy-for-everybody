class AddDefaultValueToTeacher < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :teacher, :boolean, default: false
  end
end

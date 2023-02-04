class ChangeFieldInPrograms < ActiveRecord::Migration[7.0]
  def change
    remove_column :programs, :descritpion
    add_column :programs, :description, :text
  end
end

class AddNameToProgram < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :name, :string
  end
end

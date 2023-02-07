class DropTableTeachers < ActiveRecord::Migration[7.0]
  def change
    # remove_column :programs, :teacher
    drop_table :teachers, force: :cascade
  end
end

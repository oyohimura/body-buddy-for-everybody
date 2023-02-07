class RemoveTeacherFromPrograms < ActiveRecord::Migration[7.0]
  def change
    remove_column :programs, :teacher_id
  end
end

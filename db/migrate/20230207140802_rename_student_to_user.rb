class RenameStudentToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :slot_students, :student_id, :user_id
  end
end

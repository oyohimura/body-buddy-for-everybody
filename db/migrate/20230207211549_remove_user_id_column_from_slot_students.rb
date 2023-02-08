class RemoveUserIdColumnFromSlotStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :slot_students, :user_id
  end
end

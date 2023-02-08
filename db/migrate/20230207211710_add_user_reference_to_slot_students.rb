class AddUserReferenceToSlotStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :slot_students, :user, null: false, foreign_key: true
  end
end

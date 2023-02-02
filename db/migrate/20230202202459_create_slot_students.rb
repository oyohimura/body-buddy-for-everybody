class CreateSlotStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :slot_students do |t|
      t.references :slot, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

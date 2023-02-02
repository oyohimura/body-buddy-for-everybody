class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.references :lesson, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :access_link

      t.timestamps
    end
  end
end

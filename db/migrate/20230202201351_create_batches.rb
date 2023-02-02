class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.references :program, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :max_students

      t.timestamps
    end
  end
end

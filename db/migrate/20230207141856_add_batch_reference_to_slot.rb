class AddBatchReferenceToSlot < ActiveRecord::Migration[7.0]
  def change
    add_reference :slots, :batch, null: false, foreign_key: true
  end
end

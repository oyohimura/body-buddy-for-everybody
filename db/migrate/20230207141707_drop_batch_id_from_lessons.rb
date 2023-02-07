class DropBatchIdFromLessons < ActiveRecord::Migration[7.0]
  def change
    rename_column :lessons, :batch_id, :program_id
  end
end

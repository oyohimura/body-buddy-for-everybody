class RemoveProgramIdColumnFromLessons < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :program_id
  end
end

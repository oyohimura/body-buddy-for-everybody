class DropStudentsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :students, force: :cascade
  end
end

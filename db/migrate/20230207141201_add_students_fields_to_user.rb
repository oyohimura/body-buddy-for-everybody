class AddStudentsFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :batch, foreign_key: true
  end
end

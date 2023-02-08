class AddProgramReferenceToLessons < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :program, null: false, foreign_key: true
  end
end

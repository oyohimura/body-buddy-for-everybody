class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :language

      t.timestamps
    end
  end
end

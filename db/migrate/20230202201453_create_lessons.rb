class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :number
      t.references :batch, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

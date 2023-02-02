class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :discipline
      t.string :level
      t.string :target
      t.string :duration
      t.references :teacher, null: false, foreign_key: true
      t.integer :price
      t.text :descritpion
      t.string :language

      t.timestamps
    end
  end
end

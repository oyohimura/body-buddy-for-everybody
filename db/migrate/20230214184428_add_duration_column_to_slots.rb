class AddDurationColumnToSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :duration, :integer
  end
end

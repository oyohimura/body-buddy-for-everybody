class SlotStudent < ApplicationRecord
  belongs_to :slot
  belongs_to :student
end

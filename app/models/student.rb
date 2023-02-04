class Student < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  has_many :slots, through: :slot_students
  validates :status, presence: true

  enum status: %i[pending approved rejected]
end

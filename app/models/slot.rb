class Slot < ApplicationRecord
  belongs_to :lesson
  has_many :slot_students
  has_many :students, through: :slot_students
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :access_link, presence: true
end

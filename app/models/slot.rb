class Slot < ApplicationRecord
  belongs_to :lesson
  belongs_to :batch
  has_many :slot_students, dependent: :destroy
  has_many :users, through: :slot_students
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :access_link, presence: true
end

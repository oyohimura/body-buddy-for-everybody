class Slot < ApplicationRecord
  belongs_to :lesson
  belongs_to :batch
  has_many :slot_students, dependent: :destroy
  has_many :users, through: :slot_students
  validates :start_time, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :access_link, presence: true

  def time_formatted
    start_time.strftime('%A, %B %e, at %I:%M %p')
  end
end

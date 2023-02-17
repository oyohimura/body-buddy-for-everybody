class Batch < ApplicationRecord
  before_destroy :undo_booking
  belongs_to :program
  has_many :slots, dependent: :destroy
  has_many :users
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_students, presence: true, numericality: true
  validate :batch_duration_within_program_duration

  private

  def undo_booking
    users = User.where(batch: self)
    users.each do |user|
      user.batch = nil
      user.save!
    end
  end

  def batch_duration_within_program_duration
    if (end_time - start_time) / 1.month > program.duration.to_i
      errors.add(:end_time, "can't exceed program duration")
    end
  end

end

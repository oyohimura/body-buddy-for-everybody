class Batch < ApplicationRecord
  before_destroy :undo_booking
  belongs_to :program
  has_many :slots, dependent: :destroy
  # à verifier
  has_many :users
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_students, presence: true, numericality: true

  private

  def undo_booking
    users = User.where(batch: self)
    users.each do |user|
      user.batch = nil
      user.save!
    end
  end
end

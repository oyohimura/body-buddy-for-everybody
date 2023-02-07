class Batch < ApplicationRecord
  belongs_to :program
  has_many :slots, dependent: :destroy
  # à verifier
  has_many :users
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_students, presence: true, numericality: true
end

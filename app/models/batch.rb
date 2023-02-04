class Batch < ApplicationRecord
  belongs_to :program
  has_many :lessons, dependent: :destroy
  has_many :students, dependent: :destroy
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_students, presence: true, numericality: true
end

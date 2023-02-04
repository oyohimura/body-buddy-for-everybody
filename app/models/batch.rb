class Batch < ApplicationRecord
  belongs_to :program
  has_many :lessons
  has_many :students
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :max_students, presence: true, numericality: true
end

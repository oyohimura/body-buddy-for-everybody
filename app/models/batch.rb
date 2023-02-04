class Batch < ApplicationRecord
  belongs_to :program
  has_many :lessons, dependent: :destroy
  has_many :students, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :max_students, presence: true, numericality: true
end

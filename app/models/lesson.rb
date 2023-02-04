class Lesson < ApplicationRecord
  belongs_to :batch
  has_many :slots
  validates :number, presence: true, numericality: true
  validates :title
  validates :description, length: { minimum: 20 }
end

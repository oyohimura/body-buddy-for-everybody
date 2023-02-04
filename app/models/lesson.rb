class Lesson < ApplicationRecord
  belongs_to :batch
  has_many :slots, dependent: :destroy
  validates :number, presence: true, numericality: true
  validates :title, presence: true
  validates :description, length: { minimum: 20 }
end

class Lesson < ApplicationRecord
  belongs_to :program
  has_many :slots, dependent: :destroy
  validates :number, presence: true, numericality: true
  validates :title, presence: true
  validates :description, length: { minimum: 5 } #changed from 20 to 5
  has_one_attached :media
end

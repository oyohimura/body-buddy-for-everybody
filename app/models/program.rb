class Program < ApplicationRecord
  belongs_to :teacher
  has_many :batches, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :medias
  DISCIPLINES = ["Yoga", "Pilates", "Dance", "Meditation"]
  validates :discipline, inclusion: { in: DISCIPLINES }
  LEVELS = ["Beginner", "Intermediate", "Advanced"]
  validates :level, inclusion: { in: LEVELS }
  validates :target, presence: true
  validates :duration, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :medias, presence: true
  validates :description, length: { minimum: 20 }
  LANGUAGES = ["French", "English", "Spanish", "German", "Japanese"]
  validates :language, inclusion: { in: LANGUAGES }
end

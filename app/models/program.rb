class Program < ApplicationRecord
  DURATIONS = ['1', '2', '4', '6']
  DISCIPLINES = ["Yoga", "Pilates", "Dance", "Meditation"]
  LEVELS = ["Beginner", "Intermediate", "Advanced"]
  LANGUAGES = ["French", "English", "Spanish", "German", "Japanese"]
  belongs_to :user
  has_many :batches, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many_attached :medias
  validates :name, presence: true
  validates :discipline, presence: true, inclusion: { in: DISCIPLINES }
  validates :level, presence: true, inclusion: { in: LEVELS }
  validates :target, presence: true
  validates :duration, presence: true, inclusion: { in: DURATIONS }
  validates :price, presence: true, numericality: true
  validates :medias, presence: true
  validates :description, length: { minimum: 3 }
  validates :language, presence: true, inclusion: { in: LANGUAGES }
end

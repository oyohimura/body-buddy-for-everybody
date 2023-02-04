class Program < ApplicationRecord
  belongs_to :teacher
  has_many :batches
  has_many :reviews
  has_many_attached :medias
  validates :discipline, inclusion: { in: %w(Yoga Pilates Dance Meditation), message: "%{value} is not a valid discipline" }
  validates :level, inclusion: { in: %w(Beginner Intermediate Advanced), message: "%{value} is not a valid level" }
  validates :target, presence: true
  validates :duration, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :medias, presence: true
  validates :description, length: { minimum: 20 }
  validates :language, inclusion: { in: %w(French English Spanish German Japanese), message: "%{value} is not a valid language" }
end

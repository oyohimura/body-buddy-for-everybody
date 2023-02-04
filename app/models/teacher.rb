class Teacher < ApplicationRecord
  belongs_to :user
  has_many :programs, dependent: :destroy
  validates :description, length: { minimum: 20 }
  LANGUAGES = ["French", "English", "Spanish", "German", "Japanese"]
  validates :language, inclusion: { in: LANGUAGES }
end

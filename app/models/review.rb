class Review < ApplicationRecord
  belongs_to :program
  belongs_to :user
  validates :rating, presence: true, numericality: true, inclusion: { in: [1, 2, 3, 4, 5], message: "Please choose between 1 to 5" }
  validates :comment, length: { minimum: 20 }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :batch, optional: true
  has_many :reviews, dependent: :destroy

  has_many :programs, dependent: :destroy # added 8-2-2023
  has_many :slot_students, dependent: :destroy # added 8-2-2023
  has_many :slots, through: :slot_students # added 8-2-2023

  has_one_attached :profile_picture
  validates :profile_picture, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :description, length: { minimum: 5 } #changed from 20 to 5
  LANGUAGES = ["French", "English", "Spanish", "German", "Japanese"]
  validates :language, inclusion: { in: LANGUAGES }
end

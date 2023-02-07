class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :batches, optional: true
  has_many :reviews, dependent: :destroy
  has_one_attached :profile_picture
  validates :profile_picture, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :description, length: { minimum: 20 }
  LANGUAGES = ["French", "English", "Spanish", "German", "Japanese"]
  validates :language, inclusion: { in: LANGUAGES }
  validates :teacher, presence: true
end

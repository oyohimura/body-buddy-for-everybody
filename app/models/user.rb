class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :profile_picture
  validates :profile_picture, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end

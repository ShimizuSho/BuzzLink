class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :followers, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :folders, dependent: :destroy

end

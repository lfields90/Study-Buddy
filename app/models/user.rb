class User < ActiveRecord::Base
  has_many :reviews
  has_many :spots
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true, length: { maximum: 25 }

  mount_uploader :profile_photo, ProfilePhotoUploader
end

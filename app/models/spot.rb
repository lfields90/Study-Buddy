class Spot < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :type, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :website_url
  validates :photo_url
  validates :phone, presence: true
end

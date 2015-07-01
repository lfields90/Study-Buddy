class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :phone, length: { minimum: 10 }
end

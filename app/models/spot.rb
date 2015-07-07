class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :phone, length: { minimum: 10 }

  def self.search(search)
    where("name ILIKE ?
          OR description ILIKE ?
          OR address ILIKE ?
          OR zip_code ILIKE ?
          OR city ILIKE ?
          OR state ILIKE ?
          OR category ILIKE ? ", "%#{search}%",
          "%#{search}%", "%#{search}%", "%#{search}%",
          "%#{search}%", "%#{search}%", "%#{search}%"
        )
  end
end

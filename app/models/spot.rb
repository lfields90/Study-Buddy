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
  validates :user, presence: true

  include PgSearch
  pg_search_scope :search,
    :against => [:name, :description, :address, :category, :city, :state, :phone, :zip_code, :website_url],
    :using => {
      :tsearch => { :prefix => true }
    }
end

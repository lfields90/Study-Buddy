class Review < ActiveRecord::Base
  belongs_to :spot

  validates :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
  validates :body, presence: true
end

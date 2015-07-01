class Review < ActiveRecord::Base
  belongs_to :spot

  validates :rating, numericality: { greater_than: 0, less_than: 6 }
  validates :body, presence: true
  validates :spot_id, presence: true
  validates :user_id, presence: true
end

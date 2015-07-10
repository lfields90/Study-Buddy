class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :spot_id, presence: true
  validates :review_id, presence: true
  validates :vote_value, presence: true
end

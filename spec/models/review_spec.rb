require 'rails_helper'
require 'spec_helper'

describe Review do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:spot) }
end

  # spot = FactoryGirl.create(:spot)
  # user = FactoryGirl.create(:user)




  # it "has a valid factory" do
  #   FactoryGirl.build(:review, user_id: user.id, spot_id: spot.id).should be_valid
  # end
  # it "is invalid without rating" do
  #   FactoryGirl.build(:review, user_id: user.id, spot_id: spot.id, rating: nil).should_not be_valid
  # end
  # it "is invalid without body" do
  #   FactoryGirl.build(:review, user_id: user.id, spot_id: spot.id, body: nil).should_not be_valid
  # end
  # it "is invalid without spot id" do
  #   FactoryGirl.build(:review, user_id: user.id, spot_id: nil).should_not be_valid
  # end
  # it "is invalid without user id" do
  #   FactoryGirl.build(:review, spot_id: spot.id, user_id: nil).should_not be_valid
  # end

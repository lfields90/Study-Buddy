require 'rails_helper'
require 'spec_helper'

describe Spot do
  it "has a valid factory" do
    FactoryGirl.create(:spot).should be_valid
  end
  it "is invalid without name" do
    FactoryGirl.build(:spot, name: nil).should_not be_valid
  end
  it "is invalid without description" do
    FactoryGirl.build(:spot, description: nil).should_not be_valid
  end
  it "is invalid without category" do
    FactoryGirl.build(:spot, category: nil).should_not be_valid
  end
  it "is invalid without address" do
    FactoryGirl.build(:spot, address: nil).should_not be_valid
  end
  it "is invalid without city" do
    FactoryGirl.build(:spot, city: nil).should_not be_valid
  end
  it "is invalid without state" do
    FactoryGirl.build(:spot, state: nil).should_not be_valid
  end
  it "is invalid without zip code" do
    FactoryGirl.build(:spot, zip_code: nil).should_not be_valid
  end
end

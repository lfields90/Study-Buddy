require 'rails_helper'
require 'spec_helper'

describe Spot do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_length_of(:zip_code) }

  describe ".search" do
    context 'using the search bar' do
      it "returns matching results for city" do
        spot = FactoryGirl.create(:spot, city: 'Boston')
        results = Spot.search("Boston")
        expect(results).to match_array([spot])
      end

      it "returns np matching results for city" do
        FactoryGirl.create(:spot, city: 'Boston')
        results = Spot.search("Gibberish")
        expect(results).to match_array([])
      end
    end
  end
end

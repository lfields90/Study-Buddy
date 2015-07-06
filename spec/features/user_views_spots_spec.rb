require 'rails_helper'

feature "User views study spots" do

  # As a user I want to view study spots
  # so that I can decide where to study.
  # Acceptance criteria:
  # - User can view a list of spots and see details for each spot.

  scenario 'I want to view study spots' do
    spot1 = FactoryGirl.create(:spot)
    spot2 = FactoryGirl.create(:spot)

    visit spots_path

    expect(page).to have_content(spot1.name)
    expect(page).to have_content(spot2.name)
  end
end

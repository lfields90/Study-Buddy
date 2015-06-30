require 'rails_helper'

feature "User views study spots" do

  # As a user I want to view study spots
  # so that I can decide where to study.
  # Acceptance criteria:
  # - User can view a list of spots and see details for each spot.

  scenario 'I want to view study spots' do
    visit '/spots'

    expect(page).to have_content("Launch Academy")
  end
end

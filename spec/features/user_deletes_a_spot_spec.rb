require 'rails_helper'

feature "User deletes a spot" do

# As a user I want to be able to edit a spot I created
# so that the information is up-to-date.
# Acceptance criteria:
# User can edit the spot they created.

  scenario 'I want to delete a study spot' do
    spot = FactoryGirl.create(:spot)
    visit spot_path(spot)

    expect(page).to have_content("Spot deleted")
  end
end

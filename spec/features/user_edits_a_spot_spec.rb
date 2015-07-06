require 'rails_helper'

feature "User edits a spot" do

# As a user I want to be able to edit a spot I created
# so that the information is up-to-date.
# Acceptance criteria:
# User can edit the spot they created.

  scenario 'I want to edit a study spot' do
    spot = FactoryGirl.create(:spot)
    visit edit_spot_path(spot)

    fill_in 'State', with: "MA"
    fill_in 'City', with: "Boston"
    fill_in 'Zip code', with: "01456"
    fill_in 'Address', with: "33 Harrison Ave."
    fill_in 'Description', with: "It is a room."
    fill_in 'Name', with: "Launch Academy"
    fill_in 'Category', with: "room"
    fill_in 'Website url', with: "http://launchacademy.com"
    fill_in 'Phone', with: "1434321434"
    click_button("Edit spot")

    expect(page).to have_content("33 Harrison Ave")
    expect(page).to have_content("Launch Academy")
  end

  scenario 'I want to edit a study spot' do
    spot = FactoryGirl.create(:spot)
    visit edit_spot_path(spot)

    fill_in 'Name', with: ""
    click_button("Edit spot")

    expect(page).to have_content("Name can't be blank")
  end
end

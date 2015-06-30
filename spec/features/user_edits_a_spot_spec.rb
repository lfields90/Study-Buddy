require 'rails_helper'

feature "User edits a spot" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # - User can edit the spot they created.

  xscenario 'I want to edit a study spot' do
    visit '/spots/1/edit'

    fill_in 'state', with: 'MA'
    fill_in 'city', with: 'Boston'
    fill_in 'zip', with: 01456
    fill_in 'address', with: '33 Harrison Ave.'
    fill_in 'description', with: 'It is a room.'
    fill_in 'name', with: 'Launch Academy'
    fill_in 'type', with: 'room'
    fill_in 'website', with: 'http://launchacademy.com'
    fill_in 'phone', with: 1434321434
    click_button('submit')

    expect(page).to have_content("33 Harrison Ave")
    expect(page).to have_content("Launch Academy")
  end
end

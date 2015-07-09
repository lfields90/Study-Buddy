require 'rails_helper'

feature "Users edit a spot" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit the spot they created.

  scenario 'I am a signed in user and I want to edit a spot that I created' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "#{spot.name}"
    click_link "Edit spot"

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

    expect(page).to have_content("Spot updated.")
    expect(page).to have_content("33 Harrison Ave")
    expect(page).to have_content("Launch Academy")
    expect(page).to have_content("Reviews!")
  end

  scenario 'I am a signed in user and I want to edit a spot that I did not create' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

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

    expect(page).to have_content("You don't have permission to edit that spot.")
    expect(page).to have_content(spot.state)
    expect(page).to have_content(spot.name)
    expect(page).to have_content("Reviews!")
  end

  scenario 'Signed in user gives invalid info to edit a spot' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_spot_path(spot)

    fill_in 'Name', with: ""
    click_button("Edit spot")

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'I am not signed in and I want to edit a spot' do
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

    expect(page).to have_content("You don't have permission to edit that spot.")
    expect(page).to have_content(spot.state)
    expect(page).to have_content(spot.name)
    expect(page).to have_content("Reviews!")
  end

  scenario 'I am an admin and I want to edit a spot' do
    user = FactoryGirl.create(:admin)
    spot = FactoryGirl.create(:spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

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

    expect(page).to have_content("Spot updated.")
    expect(page).to have_content("33 Harrison Ave")
    expect(page).to have_content("Launch Academy")
  end
end

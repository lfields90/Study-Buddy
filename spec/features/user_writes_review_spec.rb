require 'rails_helper'

feature "User writes a review for a Spot" do

  # As a user
  # I want to write a review for a study spot
  # to help other users decide where to study.

  # Acceptance Criteria
  # - User can add a review

  scenario 'I want to review a study spot' do
    spot1 = Spot.create(
      state: "MA", city: 'Boston',
      zip_code: "12345", address: "33 Harrison Ave.",
      name: "Launch Academy",
      description: "It's a big room.",
      phone: "1434321434",
      website_url: "http://launchacademy.com",
      category: "room"
    )

    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit new_spot_review_path(spot1)
    choose '4'
    fill_in "Body", with: "I love this place!"
    click_button('Add Review')
    expect(page).to have_content("I love this place!")
    expect(page).to have_content("Review successfully added")
  end

  scenario 'I want to review a study spot' do
    spot1 = Spot.create(
      state: "MA", city: 'Boston',
      zip_code: "12345", address: "33 Harrison Ave.",
      name: "Launch Academy",
      description: "It's a big room.",
      phone: "1434321434",
      website_url: "http://launchacademy.com",
      category: "room"
    )
    visit new_spot_review_path(spot1)
    fill_in 'Body', with: 'I love this place!'
    click_button('Add Review')
    expect(page).to have_content("Rating can't be blank")
  end

  scenario 'I want to review a study spot' do
    spot1 = Spot.create(
      state: "MA", city: 'Boston',
      zip_code: "12345", address: "33 Harrison Ave.",
      name: "Launch Academy",
      description: "It's a big room.",
      phone: "1434321434",
      website_url: "http://launchacademy.com",
      category: "room"
    )
    visit new_spot_review_path(spot1)
    choose '2'
    fill_in 'Body', with: ''
    click_button('Add Review')
    expect(page).to have_content("Body can't be blank")
  end
end

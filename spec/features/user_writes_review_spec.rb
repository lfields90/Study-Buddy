require 'rails_helper'

feature "User writes a review for a Spot" do

  # As a user
  # I want to write a review for a study spot
  # to help other users decide where to study.

  # Acceptance Criteria
  # - User can add a review

  scenario 'I want to review a study spot' do
    spot = FactoryGirl.create(:spot)

    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit new_spot_review_path(spot)
    choose '4'
    fill_in "Body", with: "I love this place!"
    click_button('Add Review')
    expect(page).to have_content("I love this place!")
    expect(page).to have_content("Review successfully added")
  end

  scenario 'I want to review a study spot' do
    spot = FactoryGirl.create(:spot)

    visit new_spot_review_path(spot)
    fill_in 'Body', with: 'I love this place!'
    click_button('Add Review')
    expect(page).to have_content("Rating can't be blank")
  end

  scenario 'I want to review a study spot' do
    spot = FactoryGirl.create(:spot)

    visit new_spot_review_path(spot)
    choose '2'
    fill_in 'Body', with: ''
    click_button('Add Review')
    expect(page).to have_content("Body can't be blank")
  end
end

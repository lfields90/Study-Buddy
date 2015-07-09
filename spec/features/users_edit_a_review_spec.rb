require 'rails_helper'

feature "Users edit a review" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit the review they created.

  scenario 'I am a signed in user and I want to edit a review that I created' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "#{spot.name}"
    click_link "Edit review"

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Edit Review"

    expect(page).to have_content("Review updated")
    expect(page).to have_content("Great study spot")
  end

  scenario 'I am a signed in user and I want to edit a review that I did not create' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "#{spot.name}"
    click_link "Edit review"

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Edit Review"

    expect(page).to have_content("You don't have permission to edit that review.")
    expect(page).to have_content("Reviews!")
  end

  scenario 'Signed in user gives invalid info to edit a review' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "#{spot.name}"
    click_link "Edit review"

    choose "1"
    fill_in "Body", with: ""
    click_button "Edit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Rate")
  end

  scenario 'I am not signed in and I want to edit a review' do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot)

    visit spots_path
    click_link "#{spot.name}"
    click_link "Edit review"

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Edit Review"

    expect(page).to have_content("You don't have permission to edit that review.")
    expect(page).to have_content("Reviews!")
  end

  scenario 'I am an admin and I want to edit a review' do
    user = FactoryGirl.create(:admin)
    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "#{spot.name}"
    click_link "Edit review"

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Edit Review"

    expect(page).to have_content("Review updated")
    expect(page).to have_content("Great study spot")
  end
end

require 'rails_helper'

feature "User reads and votes on reviews" do

  # As a user I want to be able to read other reviews and vote on them
  # so that others know if the review is good.
  # Acceptance criteria:
  # - User can upvote or downvote another user's review.
  # - User can see all reviews for a spot.

  scenario 'I want to endorse another review', :js => true do

    visit new_user_registration_path

    fill_in 'Email', with: 'What@what.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    visit new_spot_path

    fill_in "Name", with: "Launch Academy"
    fill_in "Description", with: "This is a super chill, totally rad-tacular
      place to study"
    fill_in "Category", with: "Shared workspace"
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    fill_in "State", with: "MA"
    fill_in "Zip code", with: "03032"
    fill_in "Website url", with: "http://pinballwizard.com"
    fill_in "Photo url", with:
      "http://www.bootcamps.in/wp-content/uploads/2013/01/
      Launch_Academy_Logo.jpg"
    fill_in "Phone", with: "6173659985"

    click_button "Add new spot"

    click_link "Launch Academy"

    click_link "Add a Review"

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Add Review"

    expect(page).to have_content("Total votes: 0")

    click_button('Upvote')

    expect(page).to have_content("Total votes: 1")

  end
end

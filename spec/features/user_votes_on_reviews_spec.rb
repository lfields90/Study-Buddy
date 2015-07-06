require 'rails_helper'

feature "User reads and votes on reviews" do

  # As a user I want to be able to read other reviews and vote on them
  # so that others know if the review is good.
  # Acceptance criteria:
  # - User can upvote or downvote another user's review.
  # - User can see all reviews for a spot.

  scenario 'I want to endorse another review', :js => true do
    spot = FactoryGirl.create(:spot)
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:review, user_id: user.id, spot_id: spot.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
binding.pry
    visit spot_path(spot)

    expect(page).to have_content("Total votes: 0")

    click_button('Upvote')

    expect(page).to have_content("Total votes: 1")
  end
end

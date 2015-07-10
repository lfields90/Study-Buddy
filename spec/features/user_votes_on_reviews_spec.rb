require 'rails_helper'

feature "User reads and votes on reviews" do

  # As a user I want to be able to read other reviews and vote on them
  # so that others know if the review is good.
  # Acceptance criteria:
  # - User can upvote or downvote another user's review.
  # - User can see all reviews for a spot.

  pending scenario 'I want to endorse another review' do
    spot = FactoryGirl.create(:spot)
    vist spot_path(spot)

    click_button('upvote')

    expect(page).to have_content("You upped that review!")
  end
end


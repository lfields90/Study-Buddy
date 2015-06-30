require 'rails_helper'

feature "User reads and votes on reviews" do

# As a user I want to be able to read other reviews and vote on them
# so that others know if the review is good.
# Acceptance criteria:
# - User can upvote or downvote another user's review.
# - User can see all reviews for a spot.


  scenario 'I want to see reviews for a spot' do
    let(:first_review) { Review.create(rating: 4, body: 'I hate this place!', user_id: 1, spot_id: 1) }
    let(:second_review) { Review.create(rating: 2, body: 'This place rocks!', user_id: 2, spot_id: 1) }

    visit '/spots/1'

    expect(page).to have_content("I hate this place!")
    expect(page).to have_content("This place rocks!")
  end


    scenario 'I want to endorse another review' do
      visit '/spots/3'

      click_button('upvote')

      expect(page).to have_content("You upped that review!")
  end
end

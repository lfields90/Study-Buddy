require 'rails_helper'

feature "User edits a review" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit the review they created.

  scenario 'I want to edit a study spot review' do
    spot = FactoryGirl.create(:spot)
    review = FactoryGirl.create(:review, user_id: user.id, spot_id: spot.id)
    visit edit_spot_review_path(spot, review)

    choose '3'
    fill_in 'Body', with: 'Pretty cool'
    click_button("Edit review")

    expect(page).to have_content(spot.name)
    expect(page).to have_content(review.body)
  end
end

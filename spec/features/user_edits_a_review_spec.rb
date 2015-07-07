require 'rails_helper'

feature "User edits a review" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit the review they created.

  before :each do
    user = FactoryGirl.create(:user)
    spot = Spot.new
    spot.name = 'asdfasdf'
    spot.description = 'lala'
    spot.category = 'asdf'
    spot.address = '44 street'
    spot.city = 'Dove'
    spot.state = 'MA'
    spot.zip_code = '12345'
    spot.phone = '1234565432'
    spot.user = user

    spot.save
    review = FactoryGirl.create(:review, user_id: user.id, spot_id: spot.id)
    visit edit_spot_review_path(spot, review)

    expect(page).to have_content(spot.name)
  end

  scenario 'I want to edit a study spot review' do

    choose '3'
    fill_in 'Body', with: 'Pretty cool'
    click_button("Edit Review")

    expect(page).to have_content('Pretty cool')
  end

  scenario 'Invalid edit of a study spot review' do

    fill_in 'Body', with: ''
    click_button("Edit Review")

    expect(page).to have_content("Body can't be blank")
  end
end

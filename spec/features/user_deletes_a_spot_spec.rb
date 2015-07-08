require 'rails_helper'

feature "Non-admin user cannot delete a spot" do

  # As a user I want to be able to edit a spot I created
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit the spot they created.

  scenario 'I want to delete a study spot but am not an admin' do

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
    visit spot_path(spot)

    click_link "Delete spot"
    expect(page).to have_content(
      "You don't have permission to destroy that spot."
    )
  end
end

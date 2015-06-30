require 'rails_helper'

feature "User views study spots" do

  # As a user I want to view study spots
  # so that I can decide where to study.
  # Acceptance criteria:
  # - User can view a list of spots and see details for each spot.


  scenario 'I want to view study spots' do
    visit '/spots/index'

    let(:first_spot) { Review.create(state: "MA", city: 'Boston', zip: 12345, address: "33 Harrison Ave.", name: "Launch Academy", description: "It's a big room.", phone: 1434321434, website: "http://launchacademy.com", type: "room", user_id: 1) }
    let(:second_spot) { Review.create(state: "MA", city: 'Boston', zip: 12345, address: "126 Boylston Ave.", name: "Thinking Cup", description: "It's a place.", phone: 1437721434, website: "http://thinkingcup.com", type: "coffeeshop", user_id: 1) }

    expect(page).to have_content("33 Harrison Ave.")
    expect(page).to have_content("It's a place")
  end
end

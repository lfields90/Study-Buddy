require "rails_helper"

feature "searching" do

  # As a user I want to search for study spots
  # so that I can decide where to study.
  # Acceptance criteria:
  # - User can view a list of spots and see details for searched spot.

  scenario 'I want to search for study spots' do
    spot = FactoryGirl.create(:spot)
    visit spots_path

    fill_in "search", with: spot.address
    click_button("Search")

    expect(page).to have_content(spot.name)
  end

  scenario 'I should get a message when nothing matches my search' do
    visit spots_path

    fill_in "search", with: "Gibberish"
    click_button("Search")

    expect(page).to have_content("
      There are no spots containing the infomation given in query."
      )
  end
end

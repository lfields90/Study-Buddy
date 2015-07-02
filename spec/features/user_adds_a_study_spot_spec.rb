require "rails_helper"

feature "adding spot" do
  scenario "users add a new spot" do
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

    expect(page).to have_content("Spot added.")
  end
end
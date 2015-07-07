require "rails_helper"

feature "adding spot" do
  scenario "user adds a new spot" do

    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Example'
    fill_in 'Username', with: 'johnex'

    click_button 'Sign up'
    click_link 'Add a spot'

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

  scenario "Invalid addition of new spot" do
    visit new_spot_path

    click_button "Add new spot"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end

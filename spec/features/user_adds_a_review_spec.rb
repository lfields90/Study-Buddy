require "rails_helper"

feature "adding review" do
  before :each do
    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit spot_path(spot)
    click_link("Add a review")
  end

  scenario "users add a new review" do

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Add Review"

    expect(page).to have_content("Review successfully added")
    expect(page).to have_content("Great study spot")
  end

  scenario "users add a new review with no rating" do

    fill_in "Body", with: "Great study spot"
    click_button "Add Review"

    expect(page).to have_content("Rating can't be blank")
  end

  scenario "users add a new review with no rating" do

    choose "3"
    click_button "Add Review"

    expect(page).to have_content("Body can't be blank")
  end
end

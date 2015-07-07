require "rails_helper"

feature "adding review" do
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

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit spot_path(spot)
    click_link("Add a Review")
  end

  scenario "users adds a new review" do

    choose "5"
    fill_in "Body", with: "Great study spot"
    click_button "Add Review"

    expect(page).to have_content("Review successfully added")
    expect(page).to have_content("Great study spot")
  end

  scenario "users adds a new review with no rating" do

    fill_in "Body", with: "Great study spot"
    click_button "Add Review"

    expect(page).to have_content("Rating can't be blank")
  end

  scenario "users adds a new review with no body" do

    choose "3"
    click_button "Add Review"

    expect(page).to have_content("Body can't be blank")
  end
end

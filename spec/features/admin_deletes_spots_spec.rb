require 'rails_helper'

feature "Admin deletes spots" do

  scenario 'I want to delete a study spot and am an admin' do

      user = FactoryGirl.create(:admin_user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

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
    expect(page).to have_content("Spot destroyed")
  end
end

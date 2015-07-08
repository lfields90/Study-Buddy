require 'rails_helper'

feature "Admin deletes spots" do

  scenario 'I want to delete a study spot and am an admin' do

    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    spot = FactoryGirl.create(:spot)

    visit spot_path(spot)
    click_link "Delete spot"
    expect(page).to have_content("Spot destroyed")
  end

  scenario 'I want to delete a study spot and am not an admin' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    spot = FactoryGirl.create(:spot)

    visit spot_path(spot)
    click_link "Delete spot"
    expect(page).to have_content(
      "You don't have permission to destroy that spot."
    )
  end
end

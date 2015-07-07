require 'rails_helper'

feature "admin can see and delete users" do
  scenario "admin sees a list of users" do
    user = FactoryGirl.create(:admin_user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit users_path
    expect(page).to have_content(user.email)
  end

  scenario "non-admin does not see a list of users" do
    user = FactoryGirl.create(:user)
    visit users_path
    expect(page).to have_content("Access denied! XD")
  end
end

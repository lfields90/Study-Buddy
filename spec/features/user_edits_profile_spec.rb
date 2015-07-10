require 'rails_helper'

feature "Users edit their profile" do

  # As a user I want to be able to edit my profile
  # so that the information is up-to-date.
  # Acceptance criteria:
  # User can edit their profile.
  # User cannot update others profiles


  scenario 'I want to edit my profile' do
    user = FactoryGirl.create(:user)


    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link user.username
    click_link "Edit Profile"

    fill_in "First name", with: "asdfasdf"
    click_button "Edit Profile"

    expect(page).to have_content("Profile updated")
    expect(page).to have_content("asdfasdf")
  end

  scenario 'I cant edit others profiles' do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit user_path(user_2)

    expect(page).to_not have_content("Edit Profile")
  end
end

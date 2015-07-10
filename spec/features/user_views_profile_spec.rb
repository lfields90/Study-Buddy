require 'rails_helper'

feature "User views profile" do

  # As a user I want to view my profile
  # so that I can see who I am.
  # Acceptance criteria:
  # - User can view profile info.

  scenario 'I want to view my profile' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link user.username

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
  end
end

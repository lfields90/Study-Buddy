require 'rails_helper'

feature "Admin deletes users" do

  scenario 'I am an admin and I want to delete a user' do

    FactoryGirl.create(:user)
    user = FactoryGirl.create(:admin)
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit users_path
    first(:link, "Delete user").click
    expect(page).to have_content("User destroyed")
  end
end


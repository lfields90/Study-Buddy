require 'rails_helper'

feature "Delete review" do

  scenario 'I want to delete a review and am not an admin' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot)

    visit spot_path(spot)

    click_link "Delete review"
    expect(page).to have_content(
      "You don't have permission to delete that review."
    )
  end

  scenario 'I want to delete a review and am an admin' do

    user = FactoryGirl.create(:admin)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    spot = FactoryGirl.create(:spot)
    FactoryGirl.create(:review, spot: spot)

    visit spot_path(spot)

    click_link "Delete review"
    expect(page).to have_content("Review deleted")
  end

end

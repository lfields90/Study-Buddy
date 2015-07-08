require 'rails_helper'

feature "Admin deletes review" do

  scenario 'I want to delete a review and am not an admin' do

      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
      user.admin = false

      spot = Spot.create!(
      name: 'asdfasdf',
      description: 'lala',
      category: 'asdf',
      address: '44 street',
      city: 'Dove',
      state: 'MA',
      zip_code: '12345',
      phone: '1234565432',
      user: user
      )

      Review.create!(
      rating: 4,
      body: "Sooooooo terrible!",
      spot: spot,
      user: user,
      )

    visit spot_path(spot)
    click_link "Delete review"
    expect(page).to have_content("You don't have permission to destroy that review.")
  end

  scenario 'I want to delete a review and am an admin' do

      user = FactoryGirl.create(:admin_user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      spot = Spot.create!(
      name: 'asdfasdf',
      description: 'lala',
      category: 'asdf',
      address: '44 street',
      city: 'Dove',
      state: 'MA',
      zip_code: '12345',
      phone: '1234565432',
      user: user
      )

      Review.create!(
      rating: 4,
      body: "Sooooooo terrible!",
      spot: spot,
      user: user,
      )

    visit spot_path(spot)
    click_link "Delete spot"
    expect(page).to have_content("Spot destroyed")
  end

end

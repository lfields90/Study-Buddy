require 'rails_helper'

feature "User reads and votes on reviews" do

  # As a user I want to be able to read other reviews and vote on them
  # so that others know if the review is good.
  # Acceptance criteria:
  # - User can upvote or downvote another user's review.
  # - User can see all reviews for a spot.

  scenario 'I want to upvote another review', js: true do

    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot, user: user)
    FactoryGirl.create(:review, spot: spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link spot.name
    sleep(1)
    expect(page).to have_content("Total votes: 0")
    sleep(1)
    click_button('Upvote')
    sleep(1)
    expect(page).to have_content("Total votes: 1")

  end

  scenario 'I want to downvote another review', js: true do

    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot, user: user)
    FactoryGirl.create(:review, spot: spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link spot.name
    sleep(1)
    expect(page).to have_content("Total votes: 0")
    sleep(1)
    click_button('Downvote')
    sleep(1)
    expect(page).to have_content("Total votes: -1")

  end

  scenario 'I want to upvote and revoke my vote', js: true do

    user = FactoryGirl.create(:user)
    spot = FactoryGirl.create(:spot, user: user)
    FactoryGirl.create(:review, spot: spot)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link spot.name
    sleep(1)
    expect(page).to have_content("Total votes: 0")
    sleep(1)
    click_button('Upvote')
    sleep(1)
    expect(page).to have_content("Total votes: 1")
    sleep(1)
    click_button('Revoke')
    sleep(1)
    expect(page).to have_content("Total votes: 0")

  end
end

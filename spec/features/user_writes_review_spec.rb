require 'rails_helper'

feature "User writes a review for a Spot" do

# As a user
# I want to write a review for a study spot
# to help other users decide where to study.

# Acceptance Criteria
# - User can add a review

  scenario 'I want to review a study spot' do
    visit '/spots/1/reviews/new'
    fill_in 'rating', with: '4'
    fill_in 'body', with: 'I love this place!'
    click_button('submit')

    expect(page).to have_content("I love this place!")
    expect(page).to have_content("Review sucessfully added")
  end


    scenario 'I want to review a study spot' do
      visit '/spots/1/reviews/new'
      fill_in 'rating', with: ''
      fill_in 'body', with: 'I love this place!'
      click_button('submit')

      expect(page).to have_content("You must include a rating")
  end


      scenario 'I want to review a study spot' do
        visit '/spots/1/reviews/new'
        fill_in 'rating', with: '2'
        fill_in 'body', with: ''
        click_button('submit')

        expect(page).to have_content("You must include a review")
    end
end

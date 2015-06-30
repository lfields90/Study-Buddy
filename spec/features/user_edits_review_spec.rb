require 'rails_helper'

feature "User edits a review for a Spot" do

  # As a user I want to be able to edit a review I created
  # so that the information is up-to-date.
  #
  # Acceptance criteria:
  # - User can edit the review they created.


  scenario 'I want to edit a review for a study spot' do
    visit '/spots/1/reviews/edit'
    fill_in 'rating', with: '1'
    fill_in 'body', with: 'I hate this place!'
    click_button('submit')

    expect(page).to have_content("I hate this place!")
    expect(page).to have_content("Review sucessfully updated")
  end


    scenario 'I want to review a study spot' do
      visit '/spots/1/reviews/edit'
      fill_in 'rating', with: ''
      fill_in 'body', with: 'I love this place!'
      click_button('submit')

      expect(page).to have_content("You must include a rating")
  end


      scenario 'I want to review a study spot' do
        visit '/spots/1/reviews/edit'
        fill_in 'rating', with: '2'
        fill_in 'body', with: ''
        click_button('submit')

        expect(page).to have_content("You must include a review")
    end

    scenario "I can't edit someone else's review" do
      visit '/spots/3/reviews/edit'
      fill_in 'rating', with: '2'
      fill_in 'body', with: ''
      click_button('submit')

      expect(page).to have_content("Access denied")
  end
end

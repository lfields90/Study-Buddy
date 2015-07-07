require 'rails_helper'

feature "User views study spots" do

  # As a user I want to view study spots
  # so that I can decide where to study.
  # Acceptance criteria:
  # - User can view a list of spots and see details for each spot.

  scenario 'I want to view study spots' do
    user = FactoryGirl.create(:user)
    spot1 = Spot.new
    spot1.name = 'asdfasdf'
    spot1.description = 'lala'
    spot1.category = 'asdf'
    spot1.address = '44 street'
    spot1.city = 'Dove'
    spot1.state = 'MA'
    spot1.zip_code = '12345'
    spot1.phone = '1234565432'
    spot1.user = user
    spot1.save

    spot2 = Spot.new
    spot2.name = 'asd'
    spot2.description = 'alala'
    spot2.category = 'asdfdsf'
    spot2.address = '43 street'
    spot2.city = 'Dover'
    spot2.state = 'MA'
    spot2.zip_code = '12346'
    spot2.phone = '5556557655'
    spot2.user = user
    spot2.save


    visit spots_path

    expect(page).to have_content(spot1.name)
    expect(page).to have_content(spot2.name)
  end
end

require "rails_helper"

describe ReviewMailer do
  spot = FactoryGirl.create(:spot)
  review = FactoryGirl.create(:review, spot: spot)
  email = ReviewMailer.new_review(review)

  it "should send the email to the spot creator" do
    expect(email).to deliver_to(review.spot.user)
  end

  it "should have the name of the spot" do
    expect(email).to have_body_text(review.spot.name)
  end

  it "should have a subject" do
    subject = "There is a new review for #{review.spot.name}"
    expect(email).to have_subject(subject)
  end
end

class ReviewMailer < ActionMailer::Base
  default from: "\"StudyBuddy\" <user@example.com>"

  def new_review(spot)
    @spot = spot
    subject = "There is a new review for #{review.spot.name}"
    mail(to: review.spot.user.email, subject: subject)
  end
end

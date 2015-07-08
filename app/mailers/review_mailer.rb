class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    subject = "There is a new review for #{review.spot.name}"
    mail(to: review.spot.user.email, subject: subject)
  end
end

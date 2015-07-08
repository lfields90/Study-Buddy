class ReviewMailer < ApplicationMailer
  default from: "\"StudyBuddy\" <user@example.com>"

  def new_review(review)
    @review = review

    mail(
      to: review.spot.user.email,
      subject: "New Review for #{review.product.name}")
  end
end

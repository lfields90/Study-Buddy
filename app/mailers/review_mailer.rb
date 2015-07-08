class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.spot.user.email,
      subject: "New Review for #{review.spot.name}")
  end
end

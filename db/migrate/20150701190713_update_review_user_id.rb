class UpdateReviewUserId < ActiveRecord::Migration
  def change
    change_column_null :reviews, :user_id, false
  end
end

class UpdateReviewSpotId < ActiveRecord::Migration
  def change
    change_column_null :reviews, :spot_id, false
  end
end

class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :review_id
      t.integer :spot_id
      t.integer :user_id
      t.integer :vote_value
    end
  end
end

class AddUserIdToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :user_id, :integer, null: false
  end
end

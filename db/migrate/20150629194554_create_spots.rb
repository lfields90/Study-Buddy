class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :category, null: false
      t.string :address, null: false, unique: true
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :website_url
      t.string :photo_url
      t.string :phone, null: false

      t.timestamps
    end
  end
end

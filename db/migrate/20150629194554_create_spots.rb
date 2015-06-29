class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :type, null: false
      t.string :address, null: false, unique: true
      t.string :city, null: false
      t.integer :state, null: false
      t.integer :zip_code, null: false
      t.string :website_url
      t.string :photo_url
      t.integer :phone, null: false

      t.timestamps
    end
  end
end

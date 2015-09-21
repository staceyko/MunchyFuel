class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|
      t.string :url
      t.string :photo_id
      t.boolean :vote
      t.timestamps null: false
    end
  end
end

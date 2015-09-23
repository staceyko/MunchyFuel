class Likes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :foursquares_id
      t.belongs_to :foursquares
    end
  end
end

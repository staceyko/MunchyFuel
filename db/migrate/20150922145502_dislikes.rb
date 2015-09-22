class Dislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :foursquares_id
      # t.belongs_to :foursquares
    end
  end
end

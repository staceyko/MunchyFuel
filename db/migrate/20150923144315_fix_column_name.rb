class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :likes, :foursquares_id, :foursquare_id
    rename_column :dislikes, :foursquares_id, :foursquare_id
  end
end

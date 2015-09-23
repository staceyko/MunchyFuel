class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :likes, :foursquare_id, :photo_id
    rename_column :dislikes, :foursquare_id, :photo_id
  end
end

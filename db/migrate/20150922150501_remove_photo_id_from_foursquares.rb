class RemovePhotoIdFromFoursquares < ActiveRecord::Migration
  def change
    remove_column :foursquares, :photo_id, :string
  end
end

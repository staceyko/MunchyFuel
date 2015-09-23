class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :foursquares, :photos
  end
end

class AddColumnToFoursquares < ActiveRecord::Migration
  def change
    add_column :foursquares, :vote, :boolean
  end
end

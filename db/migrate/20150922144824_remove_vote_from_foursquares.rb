class RemoveVoteFromFoursquares < ActiveRecord::Migration
  def change
    remove_column :foursquares, :vote, :boolean
  end
end

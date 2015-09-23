class Foursquare < ActiveRecord::Base
  has_many :likes
  has_many :dislikes
end

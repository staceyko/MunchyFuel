require 'pry'
class Foursquare < ActiveRecord::Base
  include FoodsHelper
  attr_reader :pic_url, :phone_num, :address
  def initialize
    @client = Foursquare2::Client.new(:client_id => ENV["foursquare_id"], :client_secret => ENV["foursquare_secret"], :api_version => '20140806')
    self.search_venues
    self.pick_random_venue
    self.get_pictures
    @pic_url = self.pick_random_picture
    @phone_num = self.get_phone_num
    @address = self.get_address
  end

  def search_venues
    random_food = return_food_array.sample

    result = @client.search_venues(:ll => '36.142064,-86.816086', :query => random_food)
    @venues = result["venues"]
    binding.pry
  end

  def pick_random_venue
    @stored_venue = @venues.sample
  end

  def get_pictures
    photo_result = @client.venue_photos(@stored_venue["id"])
    @photos = photo_result["items"]
  end

  def pick_random_picture
    @stored_photo = @photos.sample

    photo_id = @stored_photo["id"]
    prefix = @stored_photo["prefix"]
    width = @stored_photo["width"]
    height = @stored_photo["height"]
    suffix = @stored_photo["suffix"]
    photo_url = "#{prefix}#{width}x#{height}#{suffix}"
  end

  def get_phone_num
    @stored_venue["contact"]["formattedPhone"]
  end

  def get_address
    @stored_venue["location"]["formattedAddress"]
  end
end

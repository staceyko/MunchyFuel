class Foursquare < ActiveRecord::Base
  include FoodsHelper
  attr_reader :pic_url, :phone_num, :address
  def initialize
    @client = Foursquare2::Client.new(:client_id => ENV["foursquare_id"], :client_secret => ENV["foursquare_secret"], :api_version => '20140806')
    self.search_venues
    self.pick_random_venue
    self.get_pictures
    self.pick_random_picture
    self.get_phone_num
    self.get_address
  end

  def search_venues
    # until @venues != []
      @random_food = return_food_array.sample
      result = @client.search_venues(:ll => '40.7048872,-74.0123737', :query => @random_food)
      @venues = result["venues"]
    # end
  end

  def pick_random_venue
    # until get_pictures != []
      @stored_venue = @venues.sample
    # end
  end

  def get_pictures
    photo_result = @client.venue_photos(@stored_venue["id"])
  end

  def pick_random_picture
    @stored_photo = get_pictures["items"].sample

    photo_id = @stored_photo["id"]
    prefix = @stored_photo["prefix"]
    width = @stored_photo["width"]
    height = @stored_photo["height"]
    suffix = @stored_photo["suffix"]
    @pic_url = "#{prefix}#{width}x#{height}#{suffix}"
  end

  def get_phone_num
    @phone_num = @stored_venue["contact"]["formattedPhone"]
  end

  def get_address
    @address = @stored_venue["location"]["formattedAddress"]
  end
end

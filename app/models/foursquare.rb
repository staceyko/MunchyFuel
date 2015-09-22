class Foursquare < ActiveRecord::Base
  include FoodsHelper
  attr_reader :pic_url, :phone_num, :address
  def initialize
    @client = Foursquare2::Client.new(:client_id => ENV["foursquare_id"], :client_secret => ENV["foursquare_secret"], :api_version => '20140806')
    self.search_venues
    self.pick_random_venue
    self.pick_random_picture
  end

  def search_venues
    while @venues == nil || @venues == []
      @random_food = return_food_array.sample
      @result = @client.search_venues(:ll => '40.7048872,-74.0123737', :query => @random_food, :categoryId => "4d4b7105d754a06374d81259", :radius => 2000, :limit => 1)
      @venues = @result["venues"]
    end
  end

  def pick_random_venue
    while @photos == nil || @photos["count"] == 0
      @stored_venue = @venues.sample
      get_venue_pictures
    end
  end

  def get_venue_pictures
    @photos = @client.venue_photos(@stored_venue["id"])
  end

  def pick_random_picture
    @stored_photo = @photos["items"].sample

    photo_id = @stored_photo["id"]
    prefix = @stored_photo["prefix"]
    width = @stored_photo["width"]
    height = @stored_photo["height"]
    suffix = @stored_photo["suffix"]
    @pic_url = "#{prefix}#{width}x#{height}#{suffix}"
  end

  def phone_num
    @phone_num = @stored_venue["contact"]["formattedPhone"]
  end

  def address
    @address = @stored_venue["location"]["formattedAddress"]
  end

  def name
    @name = @stored_venue["name"]
  end
end

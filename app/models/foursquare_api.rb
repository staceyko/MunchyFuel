class FoursquareAPI
  include FoodsHelper

  attr_reader :pic_url, :phone_num, :address, :name

  def initialize
    @client = Foursquare2::Client.new(:client_id => ENV["foursquare_id"], :client_secret => ENV["foursquare_secret"], :api_version => '20140806')
    search_venues
    pick_random_picture
    @phone_num = @venue["contact"]["formattedPhone"]
    @address = @venue["location"]["formattedAddress"]
    @name = @venue["name"]
  end

  def search_venues
    while @venue == nil
      @random_food = return_food_array.sample
      @result = @client.search_venues(:ll => '40.7048872,-74.0123737', :query => @random_food, :categoryId => "4d4b7105d754a06374d81259", :radius => 2000, :limit => 1)

      if @result["venues"] != []
        @venue = @result["venues"][0]
      else
        next
      end

      get_venue_pictures
      @venue = nil unless @photos["count"] >= 1
    end
  end

  def get_venue_pictures
    @photos = @client.venue_photos(@venue["id"])
  end

  def pick_random_picture
    while @stored_photo == nil
      @stored_photo = @photos["items"].select{|picture| picture["width"] > picture["height"]}.sample
      if @stored_photo == nil
        @venue = nil
        search_venues
      else
        photo_id = @stored_photo["id"]
        prefix = @stored_photo["prefix"]
        width = @stored_photo["width"]
        height = @stored_photo["height"]
        suffix = @stored_photo["suffix"]
        @pic_url = "#{prefix}#{width}x#{height}#{suffix}"
      end
    end
    bad_photo
    is_bad_photo_true?
  end

  def is_bad_photo_true?
    if bad_photo == true
      @pic_url = ""
    end
  end

  def bad_photo
    if Photo.where(:url => @pic_url) != []
      x = Photo.where(:url => @pic_url)
      return true if x.first.vote == false
    end
    false
  end
end

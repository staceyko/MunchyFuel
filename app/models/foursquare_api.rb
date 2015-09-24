class FoursquareAPI
  include FoodsHelper

  attr_reader :pic_url, :phone_num, :address, :name, :venue_id, :delivery_url

  def initialize
    @client = Foursquare2::Client.new(:client_id => ENV["foursquare_id"], :client_secret => ENV["foursquare_secret"], :api_version => '20140806')
    search_venues
    @phone_num = @venue["contact"]["formattedPhone"]
    @address = @venue["location"]["formattedAddress"]
    @name = @venue["name"]
    @venue_id = @venue["id"]
    @delivery_url = @venue["delivery"]["url"] if @venue["delivery"]
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
      @venue = nil unless @photos.count >= 1
    end
  end

  def get_venue_pictures
    @photos = @client.venue_photos(@venue["id"])["items"].select{|picture| picture["width"] > picture["height"]}
    if @photos == []
      search_venues
    else
      pick_random_picture
    end
  end

  def pick_random_picture
    while @stored_photo == nil
      @stored_photo = @photos.sample
      @pic_url = create_photo_url(@stored_photo)
      if bad_photo(@pic_url)
        @venue = nil
        search_venues
      end
    end
  end

  def create_photo_url(photo_object)
    photo_id = photo_object["id"]
    prefix = photo_object["prefix"]
    width = photo_object["width"]
    height = photo_object["height"]
    suffix = photo_object["suffix"]
    "#{prefix}#{width}x#{height}#{suffix}"
  end

  def bad_photo(input_url)
    if Photo.where(:url => input_url) != []
      x = Photo.where(:url => input_url)
      if x.first.vote == false
        byebug
        return true
      end
    end
    false
  end
end

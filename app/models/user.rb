# require 'rest-client'
# require 'geocoder'

class User < ActiveRecord::Base

#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable

#   geocoded_by :ip_address,
#   :latitude => :lat, :longitude => :lon
#   after_validation :geocode

  # def get_user_location
  #   ip = RestClient.get("http://echoip.net/")
  #   results = Geocoder.search(ip)[0]
  #   latitude = results.latitude
  #   longitude = results.longitude
  #   return latitude, longitude
  # end
end

# test = User.new
# puts test.get_user_location
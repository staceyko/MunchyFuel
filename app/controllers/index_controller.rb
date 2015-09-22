class IndexController < ActionController::Base
  def welcome
    @foursquare = Foursquare.new
  end
end

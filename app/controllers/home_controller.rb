class HomeController < ActionController::Base
  def show
    @foursquare = FoursquareAPI.new
  end
end

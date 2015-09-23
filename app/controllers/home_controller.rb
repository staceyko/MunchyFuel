class HomeController < ApplicationController
  def index
    @foursquare = FoursquareAPI.new
  end
end

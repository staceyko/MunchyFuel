class IndexController < ActionController::Base
  def show
    @foursquare = Foursquare.new
  end
end

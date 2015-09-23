class PhotosController < ApplicationController
  def new
    @foursquare = FoursquareAPI.new
    @photo = Photo.new
  end

  def create
    if params["commit"] == "Bad Picture"
      @photo = Photo.find_or_create_by(url: params["url"])
      @photo.update(vote: false)
    end
    redirect_to root_path if @photo.save
  end
end

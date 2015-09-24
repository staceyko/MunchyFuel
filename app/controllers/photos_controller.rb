class PhotosController < ApplicationController
  def new
    @foursquare = FoursquareAPI.new
    @photo = Photo.new
    @dislike = @photo.dislikes.new
    @like = @photo.likes.new
  end

  def create
    if params["commit"] == "Bad Picture"
      @photo = Photo.find_or_create_by(url: params["url"])
      @photo.update(vote: false)
      redirect_to root_path if @photo.save
    elsif params["commit"] == "Don't Want"
      @photo = Photo.find_or_create_by(url: params["url"])
      @dislike = @photo.dislikes.create(photo_id: @photo.id)
      @dislike.save
      redirect_to root_path
    else params["commit"] == "Want"
      @photo = Photo.find_or_create_by(url: params["url"])
      @like = @photo.likes.create(photo_id: @photo.id)
      @like.save
      redirect_to root_path
    end
  end
end

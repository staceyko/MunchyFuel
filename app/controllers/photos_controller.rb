class PhotosController < ActionController::Base

  def new

  end

  def create
    @photo = Photo.new(photo_params)
  end

  private
  def photo_params
    params.require(:photo).permit(:vote, :url)
  end
end
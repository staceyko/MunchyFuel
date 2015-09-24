class DislikesController < ActionController::Base

  def find
    @photo = Photo.find_by_url(:url)
    unless @photo.exists?
      Photo.create(url)
    end
  end

  def new
    @dislike = Dislike.new
  end

  def create
    @Dislike.create(photo_id)
  end


private

  def strong_params
    params.require(:dislike).permit(:photo_id)
  end


end

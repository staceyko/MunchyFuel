class LikeController < ActionController::Base
  def find
    @photo = Photo.find(url)
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.created(photo_id)
  end


private
 def likes_params
   params.require(:like).permit(:photo_id)
 end
end

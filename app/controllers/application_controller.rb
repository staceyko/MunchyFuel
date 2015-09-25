class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def lat_lng
    @lat_lng = cookies[:lat_lng].split("|") unless cookies[:lat_lng] == nil
  end
end

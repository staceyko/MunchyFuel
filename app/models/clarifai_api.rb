class ClarifaiApi
  def initialize
    @client = Clarifai::Client.new(:client_id => ENV["clarifai_id"], :client_secret => ENV["clarifai_secret"])
  end
end
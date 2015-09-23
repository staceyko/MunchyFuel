require 'spec_helper'

RSpec.describe PhotosController, :type => :controller do
  describe "POST create" do
    it "has a 200 status code" do
      post :create
      expect(response.status).to eq(200)
    end
  end
end

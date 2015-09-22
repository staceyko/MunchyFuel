require 'rails_helper'

describe IndexController do
  describe '#show' do
    it 'returns a Foursquare object' do
      response = IndexController.new.show

      expect(response).to be_a Foursquare::Response
    end
  end
end
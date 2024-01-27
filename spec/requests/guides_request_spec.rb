require 'rails_helper'

RSpec.describe "Guides", type: :request do

  describe "GET /how_to_use" do
    it "returns http success" do
      get "/guides/how_to_use"
      expect(response).to have_http_status(:success)
    end
  end

end

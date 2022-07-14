require 'rails_helper'

RSpec.describe "Trades", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/trades/index"
      expect(response).to have_http_status(:success)
    end
  end

end

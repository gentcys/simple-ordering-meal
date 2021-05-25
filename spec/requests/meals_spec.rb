require 'rails_helper'

RSpec.describe "Meals", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/meals/index"
      expect(response).to have_http_status(:success)
    end
  end

end

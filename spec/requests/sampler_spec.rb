require 'rails_helper'

RSpec.describe "Samplers", type: :request do
  describe "GET /save" do
    it "returns http success" do
      get "/sampler/save"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/sampler/show"
      expect(response).to have_http_status(:success)
    end
  end

end

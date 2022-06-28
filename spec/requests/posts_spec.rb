require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "Response success" do
    it "GET /posts/index" do
      get "/posts"
      expect(response).to have_http_status(:success)
    end
  end
end

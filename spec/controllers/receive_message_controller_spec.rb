require 'rails_helper'

RSpec.describe ReceiveMessageController, :type => :controller do

  describe "GET receive" do
    it "returns http success" do
      get :receive
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST receive" do
    it "returns http success" do
      post :receive
      expect(response).to have_http_status(:success)
    end
  end
end

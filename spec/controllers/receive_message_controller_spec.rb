require 'rails_helper'

RSpec.describe ReceiveMessageController, :type => :controller do

  describe "GET receive" do

    let(:next_message) { "Buenos Dias" }

    let(:xml_response) do
      '<?xml version="1.0" encoding="UTF-8"?>'\
      '<Response>'\
      '<Message>'+next_message+'</Message>'\
      '</Response>'
    end

    let(:phone_number) { '+5213333595550' }

    before do
      allow_any_instance_of(Conversation).to receive(:next) { next_message }

      post :receive, from: phone_number
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns expected body first time" do
      expect(response.body).to eq(xml_response)
    end
  end
end

# describe "POST #receive" do
#   it "receives an SMS from Twilio" do
#     pending
#   end
  
#   it "gets the conversation from the message" do
#    pending
#   end

#   it "extracts the phone number" do
#     pending
#   end
  
#   it "identifies next message to send" do
#     pending
#   end

#   it "sends new message back to sender" do
#     pending
#   end

# end

# end

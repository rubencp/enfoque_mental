require 'rails_helper'

RSpec.describe ReceiveMessageController, :type => :controller do

  describe "GET receive" do

    let(:first_message) { "Buenos Dias" }

    let(:phone_number) { '+5213333595550' }

    before do
      allow_any_instance_of(Conversation).to receive(:next) { first_message }

      post :receive, from: phone_number
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns expected body first time" do
      expect(response.body).to eq(first_message)
    end
  end


 describe "POST #receive" do

  let(:params) { {"ToCountry"=>"DE", "ToState"=>"", "SmsMessageSid"=>"SM7744e6f93cd727f1c0557aa610740d09", "NumMedia"=>"0", "ToCity"=>"", "FromZip"=>"", "SmsSid"=>"SM7744e6f93cd727f1c0557aa610740d09", "FromState"=>"", "SmsStatus"=>"received", "FromCity"=>"", "Body"=>"hola?", "FromCountry"=>"DE", "To"=>"+4915735996394", "ToZip"=>"", "NumSegments"=>"1", "MessageSid"=>"SM7744e6f93cd727f1c0557aa610740d09", "AccountSid"=>"AC0314fc9f3347bfed7a8c9e90a34e51ce", "From"=>"+4917664825244", "ApiVersion"=>"2010-04-01"} }

  before do 
  end


   it "extracts the phone number" do
     from_number = params["From"]
     expect(from_number).to eq("+4917664825244")
    end

   it "gets the next message of the conversation" do
    from_number = params["From"]
    c = Conversation.new(from_number).next
    expect(c).to eq("¿Quién eres?")
   end

   it "gets different message on 2nd time" do
    from_number = params["From"]
    c = Conversation.new(from_number)
    msg1 = c.next
    msg2 = c.next
    expect(msg2).to eq("¿Cuál es tu propósito en esta vida?")
   end

   it "creates new user if first time" do
    from_number = params["From"]
    conversation = Conversation.new(from_number)
    user = conversation.with
    expect(user.class).to eq(User)
    expect(user.number).to eq("+4917664825244")
   end

end

end






  
#   it "identifies next message to send" do
#     pending
#   end

#   it "sends new message back to sender" do
#     pending
#   end

# end

# end

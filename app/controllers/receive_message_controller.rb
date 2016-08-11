class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    message = Conversation.new(from_number).next

   twiml = Twilio::TwiML::Response.new do |r|
    r.Message message 
   end
   twiml.text

    render plain: message
  end
end

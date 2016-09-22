class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']

    message     = User.new_conversation(from_number).next


   twiml = Twilio::TwiML::Response.new do |r|
    r.Message message 
   end
   twiml.text

    render plain: message
  end
end

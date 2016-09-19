class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    user = User.new_conversation(from_number)

    user.increment_conversation
    message = user.message

   twiml = Twilio::TwiML::Response.new do |r|
    r.Message message 
   end
   twiml.text

    render plain: message
  end
end

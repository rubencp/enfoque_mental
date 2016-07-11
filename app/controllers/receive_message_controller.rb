class ReceiveMessageController < ApplicationController

  def receive
   next_message = Conversation.new(params['phone']).next
   
   twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Buenos Dias."
    next_message = r.Message
   end
   twiml.text
   #render plain: next_message
  end

  private

  def twilio_xml(message)
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Message>"+message+"</Message></Response>"
  end

end